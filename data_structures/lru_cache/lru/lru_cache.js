const LinkedList = require('./linked_list.js');

class LRUCache{
  constructor(max){
    this.hash = {};
    this.list = new LinkedList;
    this.size = 0;
    this.max = max;
  }

  insert(key, val){
    if(typeof(this.hash[key]) !== 'undefined'){
      let node = this.hash[key];
      this.list.deleteNode(node);
      this.size -= 1;
    }
    this.list.append(key, val);
    this.hash[key] = this.list.mostRecent();
    this.size++;
    if(this.size > this.max){
      let node = this.list.oldest();
      this.list.deleteNode(node);
      delete(this.hash[node.key]);
      this.size--;
    }
  }

  getVal(key){
    if(!this.hash[key]) return null;
    let node = this.hash[key];
    return node.val;
  }

  delete(key){
    if(this.hash[key]){
      this.list.delete(key);
      delete(this.hash[key]);
      this.size--;
    }
  }
}

let cache = new LRUCache(5);
cache.insert(3,2);
cache.insert(1,5);
cache.insert(2,7);
cache.insert(0,10);
cache.insert(10,7);
console.log(cache.getVal(3));
cache.insert(6,2);
console.log(cache.getVal(3));
console.log(cache.size);
