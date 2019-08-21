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

/*
--Result--
 true
 true
 true
 true
 Ray
 ["Brian", "Eric"]
 Brian
 false
 */
