require_relative 'test_helper'

describe "Trip class" do
  describe "initialize" do
    before do
      start_time = Time.parse('2015-05-20T12:14:00+00:00')
      end_time = start_time + 25 * 60 # 25 minutes
      @trip_data = {
      id: 8,
      passenger: RideShare::Passenger.new(id: 1,
      name: "Ada",
      phone_number: "412-432-7640"),
      start_time: start_time,
      end_time: end_time,
      cost: 23.45,
      rating: 3,
      ###JARED or DEE or DEVIN or KAIDA### I can only get "stores an instance of driver" to work if I add the 2 lines below myself... 
      driver_id: 10, ###CAROLINE### I added this but IDK if I'm supposed to... 
      driver: RideShare::Driver.new(id: 1, name: "Fakey McFake", vin:'12345678901234567')###CAROLINE### I added this but IDK if I'm supposed to... 
    }
      @trip = RideShare::Trip.new(@trip_data)
    end
    
    it "is an instance of Trip" do
      expect(@trip).must_be_kind_of RideShare::Trip
    end
    
    it "stores an instance of passenger" do
      expect(@trip.passenger).must_be_kind_of RideShare::Passenger
    end
    
    it "stores an instance of driver" do
      # the seed data had NEITHER driver NOR driver_id
      puts "\n\nWHY IS THIS HAPPENING???? >>>#{@trip.driver}<<<"
      puts @trip
      expect(@trip.driver).must_be_kind_of RideShare::Driver
    end
    
    it "raises an error for an invalid rating" do
      [-3, 0, 6].each do |rating|
        @trip_data[:rating] = rating
        expect do
          RideShare::Trip.new(@trip_data)
        end.must_raise ArgumentError
      end
    end
    
    ###JULIA### ADDED BLOCK for Wave 1.1.3
    it "checks if start_time is before end_time" do   
      assert(@trip_data[:end_time] > @trip_data[:start_time])
    end
    
    ###JULIA### ADDED BLOCK for Wave 1.1.4
    it "checks if Trip.duration works" do
      # given example data is 25 minutes in duration
      assert(@trip.duration==25*60)
    end 
  end
end




