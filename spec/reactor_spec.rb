# require 'spec_helper'
# 
# class FakeReactor
#   include Arc::Reactor
# end
# class SuperFakeReactor < FakeReactor; end
# 
# module Arc
#   describe Reactor do
#     before :each do
#       ConnectionHandler.clear_connections
#     end
#     
#     describe '#connect' do
#       it 'creates a new connection pool and registers it with the connection handler' do
#         FakeReactor.connect ArcTest.config[:sqlite]
#         ConnectionHandler.connections[FakeReactor].should be_a(ConnectionPool)      
#       end
#       
#       it 'redefines the data_source for derived classes with a different configuration' do
#         FakeReactor.connect ArcTest.config[:empty]
#         ConnectionHandler.connections.size.should be(1)
#         ConnectionHandler.connections[FakeReactor].should be_a(ConnectionPool)
#         SuperFakeReactor.connect ArcTest.config[:empty]
#         ConnectionHandler.connections.size.should be(2)
#         ConnectionHandler.connections[SuperFakeReactor].should be_a(ConnectionPool)
#         ConnectionHandler.connections[SuperFakeReactor].object_id.should_not be(ConnectionHandler.connections[FakeReactor].object_id)
#         SuperFakeReactor.data_store.should_not be(FakeReactor.data_store)
#       end
#     end
#     
#     describe '#data_source' do
#       it 'yields an Arc::DataSource object associated with the proper class' do
#         FakeReactor.connect({})
#         FakeReactor.data_store.should be_a(DataStores::DataStore)
#         FakeReactor.data_store.klass.should be(FakeReactor)
#       end      
#     end
#     
#   end  
# end
