require 'heap'

describe MinHeap do

  subject(:heap) { MinHeap.new }

  describe "Initialize" do
    it 'should initialize an empty store' do
      expect(heap.store.length).to eq(0)
    end

  end

  describe "Insert" do
    it 'should increase the length of the store by 1' do
      heap.insert(1)
      expect(heap.store.length).to eq(1)
    end

    it 'should heapify up so that the min element is on top' do
      heap.insert(5)
      heap.insert(3)
      heap.insert(0)
      heap.insert(8)
      heap.insert(2)
      expect(heap.store[0]).to eq(0)
    end
  end

  describe "Extract" do
    it 'should get the minimum value from the heap' do
      heap.insert(5)
      heap.insert(3)
      heap.insert(0)
      heap.insert(8)
      heap.insert(2)
      expect(heap.extract).to eq(0)
      expect(heap.extract).to eq(2)
      expect(heap.extract).to eq(3)
      expect(heap.extract).to eq(5)
      expect(heap.extract).to eq(8)
    end
  end

end
