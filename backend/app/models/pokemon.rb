class Pokemon < ApplicationRecord
  has_one_attached :image

  validates :name, uniqueness: { case_sensitive: false }
  validates :poke_index, :hp, :attack, :defense, :speed_attack, :speed_defense, :speed, presence: true

  after_save :accumulate_all_into_total

  def calculate_total
    self.hp + self.attack + self.defense + self.speed_attack + self.speed_defense + self.speed
  end

  def accumulate_all_into_total
    self.update_column(:total, self.calculate_total)
  end

  def is_legendary?
    self.legendary
  end
end
