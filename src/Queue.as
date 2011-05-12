package 
{
   /**
    * A queue that works by the FIFO (first in, first out) principle.
    * It can store any type of data and has no fixed size.
    * @author Tox, webcodesign.de
    */
   public class Queue
   {
      private var q:Array = [];
      public var l:int = 0;
      
      /**
       * CTOR
       */
      public function Queue() { }
      
	  
		public function dump():void {
			for (var i:int = 0; i < q.length; i++) {
				trace("[" + i + "]=",q[i]);
			}
		}
	  
      /**
       * Writes data to the end of the queue.
       * @param   d   Data to write, can be of any type.
       */
      public function write(d:*):void {q.push(d);}
      
      /**
       * Reads data from the beginning of the queue.
       * @return   Data stored at the beginning of the queue.
       */
      public function read():* { l--; return (empty) ? null : q.shift(); }
      
      /**
       * Checks if the queue is empty and returns the result.
       */
      public function get empty():Boolean { return (q.length <= 0); }
      
      /**
       * Returns the data of the first queue element without removing it.
       * @return   Data of the first queue element.
       */
      public function spy():* {return (empty) ? null : q[0];}
   }
}