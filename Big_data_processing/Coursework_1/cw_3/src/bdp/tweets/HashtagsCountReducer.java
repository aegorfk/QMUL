package bdp.tweets;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class HashtagsCountReducer extends Reducer<Text, IntWritable, Text, IntWritable> {

    private IntWritable result = new IntWritable();

    public void reduce(Text key, Iterable<IntWritable> values, Context context)

        throws IOException, InterruptedException {
        int sum = 0;

        for (IntWritable value : values) {
            sum+=value.get();
        }

        result.set(sum);
        context.write(key,result);
    }

}
