class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
    # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: true
  validates :department, length: { in: 2..30 }, allow_blank: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :basic_time,  presence: true #1/8追加
  #validates :work_time,  presence: true #2/12追加
  validates :work_start_time,  presence: true #1/8追加
  validates :work_finish_time,  presence: true #1/8追加

  #渡された文字列のハッシュ値を返します。
  def User.digest(string)
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost  
      end
    BCrypt::Password.create(string, cost: cost)
  end

  #ランダムなトークンを返します。
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  # 永続セッションのためハッシュ化したトークンをデータベースに記憶します。
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # トークンがダイジェストと一致すればtrueを返します。
  def authenticated?(remember_token)
  #ダイジェストが存在しない場合はfalseを返して終了します。
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #ユーザーのログイン情報を破棄します。
  def forget
    update_attribute(:remember_digest, nil)
  end

    #importメソッド #2021/02/03追加
  def self.import(file)
    CSV.foreach(file.path, encoding: 'CP932:UTF-8',headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      user = find_by(id: row["id"]) || new
      
      # CSVからデータを取得し、設定する
      user.attributes = row.to_hash.slice(*updatable_attributes)
      user.save
    end
  end
    # 更新を許可するカラムを定義
    def self.updatable_attributes
      ["name", "email", "department", "employee_number", "card_ID", "basic_time", "work_start_time", "work_finish_time","sperior","admin,","password"]
    end
  
    def self.in_working_users
      in_working_users = Attendance.where(worked_on: Date.today, finished_at: nil).where.not(started_at: nil).pluck(:user_id).uniq
      where(id: in_working_users)
    end


end