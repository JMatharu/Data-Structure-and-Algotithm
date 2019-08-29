import UIKit

/*
 Array Queue
 */

var queueArray = QueueArray<String>()
queueArray.isEmpty
queueArray.enqueue("Ray")
queueArray.enqueue("Brian")
queueArray.enqueue("Eric")
queueArray.dequeue()
queueArray
queueArray.peek
queueArray.isEmpty

/* --Result--
 true
 true
 true
 true
 Ray
 ["Brian", "Eric"]
 Brian
 false
 */


/*
 Linked List Queue
 */

var queueLinkedList = QueueLinkedList<String>()
queueLinkedList.isEmpty
queueLinkedList.enqueue("Ray")
queueLinkedList.enqueue("Brian")
queueLinkedList.enqueue("Eric")
queueLinkedList.dequeue()
queueLinkedList
queueLinkedList.peek
queueLinkedList.isEmpty

/* --Result--
 true
 true
 true
 true
 Optional("Ray")
 Brian -> Eric -> end
 Optional("Brian")
 false
 */
