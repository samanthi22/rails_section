```
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
  belongs_to :user
end
```

relational callbacks
if user destroyed so should user's posts

```
class User < ApplicationRecord
  validates :random_code, presence: true
  before_validation :ensure_random_code

  protected
  def ensure_random_code
    # assign a random code
    self.random_code ||= SecureRandom.hex(8)
  end
end
```
