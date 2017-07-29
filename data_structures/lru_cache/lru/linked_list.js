class LinkedList{

  constructor(){
    this.head = null;
    this.tail = null;
    this.length = 0;
    this.find = this.find.bind(this);
  }

  mostRecent(){
    this.tail.val;
  }

  oldest(){
    this.head.val;
  }

  append(key, val){
    let newNode = new Node(key, val);
    if(this.length === 0){
      this.head = newNode;
      this.tail = this.head;
    }
    else if(this.length === 1){
      let tail = newNode;
      tail.prev = this.head;
      this.head.next = tail;
      this.tail = tail;
    }
    else{
      let prevNode = this.tail;
      this.tail = newNode;
      prevNode.next = this.tail;
      this.tail.prev = prevNode;
    }
    this.length++;
  }

  find(key){
    let node = this.head;
    for (var i = 0; i < this.length; i++) {
      if(node.key === key) return node;
      node = node.next;
    }
    return null;
  }

  delete(key){
    let delNode = this.find(key);
    if (delNode === null) return null;

    if(this.length === 1){
      this.head = null;
      this.tail = null;
    }
    else if(this.head === delNode){
      this.head = this.head.next;
      this.head.prev = null;
    }
    else if(this.tail === delNode){
      this.tail = this.tail.prev;
      this.tail.next = null;
    }
    else{
      delNode.prev.next = delNode.next;
      delNode.next.prev = delNode.prev;
    }
    this.length--;
  }

  toString(){
    let s = "";
    let node = this.head;
    for (var i = 0; i < this.length; i++) {
      s += `${i} - key: ${node.key} - val: ${node.val}`;
      node = node.next;
    }
    return node;
  }


}

class Node{
  constructor(key, val){
    this.key = key;
    this.val = val;
    this.next = null;
    this.prev = null;
  }
}

let list = new LinkedList;
list.append(1, 5);
list.append(2, 3);
list.append(3, 4);
console.log(list);
console.log(list.length);
list.delete(2);
console.log(list);
console.log(list.length);
