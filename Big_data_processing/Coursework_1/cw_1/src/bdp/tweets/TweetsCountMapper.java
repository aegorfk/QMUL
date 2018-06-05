package bdp.tweets;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class TweetsCountMapper extends Mapper<Object, Text, Text, IntWritable>
 {
    private IntWritable one = new IntWritable(1);
     private Text data = new Text();
     //an array for our input string
     String[] fields = new String[4];
    public void map(Object key, Text line, Context context) throws IOException, InterruptedException
    {
    	final int number;
      //Fields contains line as follows.
      //   0          1                   2             3
      //epoch_time;tweetId;tweet(including #hashtags);device
//checking the length of line
if(line.toString().split(";").length == 4)
{
fields = line.toString().split(";");
}

number = fields[2].length(); //length of the tweet
//checking the length of the tweet to avoid non-standard encoding that might cause some unexpected (i.e. too high) values
if(number <= 140)
{
  //deciding to which group by the value: when it is "1-5" at the end or "6-10"
   if(number%10 <=5 && number%10 >=1)
{
//describing the length
data.set("length " + number/10  + "0-" + number/10  + "5.");
}
else
{
  int a = number/10 +1;
data.set("length " + (number/10)  + "6-" + a + "0.");
}
//sending our resulted pair to reducer for further counting
context.write(data, one);
}
}
}
