package com.lookbackon.AI.fuzzyLogicSystem
{
    /**
     * Right shoulder flip 90 degress member ship functions
     * 
	 *******e.g.*******
	 * 
	 * b
	 * |  *  
	 * |    c
	 * |     |
	 * a-----d
	 * 
	 *******e.g.*******
	 * 
     * @author Knight.zhou
     * 
     */    
    public class RightShoulderFlip90MemberShipFunction implements IMemberShipFunction
    {
        private var peakPoint:Number;
        private var upOffset:Number;
        private var downOffset:Number;
        
        public function RightShoulderFlip90MemberShipFunction(upOffset:Number,peakPoint:Number,downOffset:Number)
        {
            this.peakPoint = peakPoint;
            this.upOffset = upOffset;
            this.downOffset = downOffset;
        }

        public function memberShipOf(value:Number):Number
        {
            //check offset equal 0;
            if( (this.downOffset==0) && (value==this.peakPoint)
				||(this.upOffset==0) && (value==this.peakPoint)  
			  )
            {
                return 1.0;
            }
            //check value more than peak
            if( (value>this.peakPoint) && (value<=(this.peakPoint+this.upOffset)) )
            {
                var grad:Number = -1.0/this.upOffset;
                return grad * (value-this.peakPoint)+1.0;
            }
            //check value less than peak
            else if( (value<=this.peakPoint) && (value>=(this.peakPoint-this.downOffset)))
            {
                return 1.0;
            }
            return 0;
        }
        
    }
}