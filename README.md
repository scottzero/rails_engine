# README
[!!STILL IN DEVELOPMENT!! 93/107 spec harness tests cleared] 
# Rails Engine
Rails Engine is a Turing School of Software & Design project that uses Rails to build a JSON:API to expose (fabricated) 
sales data imported from CSV files. 

# Database Schema
  <img width="1016" alt="screenshot101" src="https://user-images.githubusercontent.com/33855435/66276509-1beca780-e851-11e9-9cfb-076d85aa727f.png">

  
# Environment Setup 
  - Ruby 2.4.1 
  - Rails 5.1.7 
  
 # clone me 
 - $ git clone https://github.com/wolfeJob/rails_engine.git
 - $ cd rails_engine
 - $ bundle install
 
 # Database Setup
 - $ rake db:{drop,create,migrate}
 - $ rake fetch:{customers,merchants,invoices,items,invoice_items,transactions}
 
 # Testing
 - $rspec [for contoller and model testing]
 
 The entire test suite csan be accessed from the spec harness, clone into your parent dir project
 - $git clone https://github.com/turingschool/rales_engine_harness.git
 
 - $ cd rails_engine
 - $ rails s
 - $ cd ../rales_engine_spec_harness 
 - $ bundle install 
 - $ bundle exec rake
 
 
 


