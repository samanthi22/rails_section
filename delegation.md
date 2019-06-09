```
class Office < ApplicationRecord
  belongs_to :doctor
end

class Doctor < ApplicationRecord
  has_one :office
  has_many :patients
end

class Patient < ApplicationRecord
  belongs_to :doctor
end
```

When documenting a patient's appointments we want to ensure we track which office and doctor the patient will be visiting.

```
<%= @patient.doctor.name %>
<%= @patient.doctor.specialty %>
<%= @patient.doctor.office.number %>
<%= @patient.doctor.office.address %>
```
```
class Patient < ApplicationRecord
  belongs_to :doctor

  def doctor_name
    doctor.name
  end
end
```

```
<%= @patient.doctor_name %>
```

```
class Owner < ApplicationRecord
  has_one :dog
  delegate :woof, to: :dog
end

class Dog < ApplicationRecord
  belongs_to :owner

  def woof
    puts 'woof'
  end
end
```

```
class Office < ApplicationRecord
  belongs_to :doctor
end

class Doctor < ApplicationRecord
  has_one :office
  has_many :patients
  delegate :number,
    :address,
    to: :office,
    prefix: true
end

class Patient < ApplicationRecord
  belongs_to :doctor
  delegate :name,
    :specialty,
    :office_number,
    :office_address,
    to: :doctor,
    prefix: true
end
```

```
<%= @patient.doctor_name %>
<%= @patient.doctor_specialty %>
<%= @patient.doctor_office_number %>
<%= @patient.doctor_office_address %>
```