package bdp.athletes;

import java.util.Arrays;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.SequenceFileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.SequenceFileOutputFormat;

enum CustomCounters {NUM_COMPANIES}

public class AthletesReplJoin {
    public static void runJob(String[] input, String output) throws Exception {

        Job job = Job.getInstance(new Configuration());
        Configuration conf = job.getConfiguration();

        job.setJarByClass(AthletesReplJoin.class);
        job.setMapperClass(AthletesReplJoinMapper.class);
        job.setInputFormatClass(SequenceFileInputFormat.class);

        job.setOutputKeyClass(IntIntPair.class);
        job.setOutputValueClass(LongWritable.class);

        job.setNumReduceTasks(0);

        job.setOutputFormatClass(SequenceFileOutputFormat.class);


        job.addCacheFile(new Path("/data/olympictweets2016rio").toUri());


        Path outputPath = new Path(output);
        FileInputFormat.setInputPaths(job, StringUtils.join(input, ","));
        FileOutputFormat.setOutputPath(job, outputPath);
        outputPath.getFileSystem(conf).delete(outputPath, true);
        job.waitForCompletion(true);
        }

    public static void main(String[] args) throws Exception {
        runJob(Arrays.copyOfRange(args, 0, args.length - 1), args[args.length - 1]);
    }
}
