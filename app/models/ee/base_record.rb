class Ee::BaseRecord < ApplicationRecord
  establish_connection(:mysql)
  self.abstract_class = true
end
