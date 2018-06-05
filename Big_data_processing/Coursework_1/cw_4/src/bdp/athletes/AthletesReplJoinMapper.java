package bdp.athletes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.Calendar;
import java.util.Hashtable;

import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AthletesReplJoinMapper extends Mapper<Text, AthletesCount, IntIntPair, LongWritable> {

	private Hashtable<String, String> companyInfo;

	private IntIntPair pair = new IntIntPair();
	private LongWritable volume = new LongWritable();
	
	public void map(Text key, AthletesCount value, Context context) throws IOException, InterruptedException {

		String name = value.getCompany().toString();
		// here we match the two tables in the joins

		String sector = companyInfo.get(name);

		if (sector!=null) {

			// we use the Calendar class of Java to convert DailyStock's time
			// field into the equivalent year
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(value.getDay().get());
			int year = calendar.get(Calendar.YEAR);

			pair.set(sector, year);
			
			volume.set(value.getVolume().get());

			context.write(pair, volume);

		} 
	}

	@Override
	protected void setup(Context context) throws IOException, InterruptedException {

		athletInfo = new Hashtable<String, String>();

		// We know there is only one cache file, so we only retrieve that URI
		URI fileUri = context.getCacheFiles()[0];

		FileSystem fs = FileSystem.get(context.getConfiguration());
		FSDataInputStream in = fs.open(new Path(fileUri));

		BufferedReader br = new BufferedReader(new InputStreamReader(in));

		String line = null;
		try {
			// we discard the header row
			br.readLine();

			while ((line = br.readLine()) != null) {
				context.getCounter(CustomCounters.NUM_COMPANIES).increment(1);
				
				String[] fields = line.split("\t");
				// Fields are: 0:Symbol 1:Name 2:IPOyear 3:Sector 4:industry
				// Fields are: 0:epoch_time 1:tweetId 2:tweet 3:device
				if (fields.length == 4)
					companyInfo.put(fields[0], fields[3]);
			}
			br.close();
		} catch (IOException e1) {
		}
		super.setup(context);
	}
}
