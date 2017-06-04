#!/usr/bin/swift

class LinkedNode {
    var value: Int!
    var next: LinkedNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

func insertList(_ head: LinkedNode, _ value: Int) {
    var last = head
    while last.next != nil {
        last = last.next!
    }
    last.next = LinkedNode(value);
}

func printLinkedList(_ head: LinkedNode?) {
    guard let head = head else { return }
    printLinkedList(head.next);
    print(head.value)
}

let head = LinkedNode(10)
insertList(head, 24);
insertList(head, 231);
insertList(head, 34);
insertList(head, 543);
insertList(head, 6);
insertList(head, 72);
insertList(head, 3);
insertList(head, 5);
insertList(head, 6);
printLinkedList(head)
