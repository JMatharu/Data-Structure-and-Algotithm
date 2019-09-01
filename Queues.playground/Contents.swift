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


var queueRingBuffer = QueueRingBuffer<String>(count: 3)
queueRingBuffer.enqueue("Ray")
queueRingBuffer.enqueue("Brian")
queueRingBuffer.enqueue("Eric")
queueRingBuffer
queueRingBuffer.dequeue()
queueRingBuffer
queueRingBuffer.peek
queueRingBuffer
queueRingBuffer.enqueue("1")
queueRingBuffer.enqueue("2")
queueRingBuffer.enqueue("3")
queueRingBuffer

/* --Result--
 true
 true
 true
 [Ray, Brian, Eric]
 Optional("Ray")
 [Brian, Eric]
 Optional("Brian")
 [Brian, Eric]
 true
 false
 false
 [Brian, Eric, 1]
 */


var queue = QueueStack<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue.dequeue()
queue
queue.peek

/* --Result--
 true
 true
 true
 Optional("Ray")
 ["Eric", "Brian"]
 Optional("Eric")
 */
