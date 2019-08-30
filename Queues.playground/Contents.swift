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
print(queueRingBuffer.enqueue("Ray"))
print(queueRingBuffer.enqueue("Brian"))
print(queueRingBuffer.enqueue("Eric"))
print(queueRingBuffer)
print(queueRingBuffer.dequeue())
print(queueRingBuffer)
print(queueRingBuffer.peek)
print(queueRingBuffer)
print(queueRingBuffer.enqueue("1"))
print(queueRingBuffer.enqueue("2"))
print(queueRingBuffer.enqueue("3"))
print(queueRingBuffer)

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
