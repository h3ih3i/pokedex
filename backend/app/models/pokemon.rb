class Pokemon < ApplicationRecord
  has_one_attached :image

  validates :name, uniqueness: { case_sensitive: false }
  validates :hp, :attack, :defense, :speed_attack, :speed_defense, :speed, presence: true

  before_create :assign_pokedex_index
  before_save :accumulate_all_into_total

  def calculate_total
    self.hp + self.attack + self.defense + self.speed_attack + self.speed_defense + self.speed
  end

  def is_legendary?
    self.legendary
  end


  private

  def accumulate_all_into_total
    self.total = self.calculate_total
  end

  def assign_pokedex_index
    max_index = Pokemon.maximum(:poke_index) || 0
    self.poke_index = max_index + 1
  end
end
