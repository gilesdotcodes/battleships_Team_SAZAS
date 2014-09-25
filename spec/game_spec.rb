require 'game.rb'
require 'ships.rb'


describe Game do
	let(:game){Game.new}
	let(:input){InputManager.new}
	let(:ship){Ship.submarine}

	let(:ship_loop){double :ship_loop, :name => anything, :direction => anything}

	it 'should have a InputManager' do
		expect(game.input_manager).not_to be(nil)  
	end

	it 'should greet you when the game is opened' do
		expect{input.greeter}.to output("Let's play Battleships!\n").to_stdout
		game.start_message
	end

	it 'should get the name and create a player' do
		game.create_player
		expect(game.player.class).to eq(Player)	
	end

	it "should assign the name to the player" do
		expect(input.get_name).to eq("ana")
		game.create_player
		expect(game.player.name).to eq("ana")
	end

	#it "should create oponets" do
	#	game.create_oponents
	#	expect(game.player).to_not eq(nil)
	#end


	it 'should create an array with each ship in it' do
		expect{game.get_ships}.to change{game.ships.count}.by(5)
	end




	#it 'should loop ships and get their initial positions' do
	#	game.get_ships
	#	expect(game.get_direction(ship_loop)).to be_call.exactly(5).times
	#	allow(ship_loop).to receive(:name)
	#	allow(ship_loop).to receive(:direction).with("h")
	#	game.get_ships_locations
	#end



end