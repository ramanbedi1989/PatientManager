class ReplaceAgeByDob < ActiveRecord::Migration
  def up
  	add_column :patients, :dob, :date 
  	Patient.all.each do |p|
  		p.dob = (Time.now - (p.age + 1).years)
  		p.save
  	end 
  	remove_column :patients, :age
  end

  def down
  	remove_column :patients, :dob
  end
end
