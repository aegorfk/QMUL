package bdp.athletes;
import java.io.*;


import org.apache.hadoop.io.*;

public class AthletesCount implements WritableComparable<AthletesCount> {

	private IntWritable id;
	private Text name;
	private Text nationality;
	private Text sex;
	private Text dob;
	private DoubleWritable height;
	private IntWritable weight;
	private Text sport;
	private IntWritable gold;
	private IntWritable silver;
	private IntWritable bronze;
	
	public AthletesCount() {
		set(
				new IntWritable(),
				new Text(), 
				new Text(),
				new Text(),
				new Text(), 
				new DoubleWritable(),
				new IntWritable(), 
				new Text(),
				new IntWritable(), 
				new IntWritable(), 
				new IntWritable()
			);
	}

	public AthletesCount(int id, String name, String nationality,
			String sex, String dob, double height, int weight,
			String sport, int gold, int silver, int bronze) {
		set(
				new IntWritable(id), 
				new Text(name),
				new Text(nationality), 
				new Text(sex),
				new Text(dob), 
				new DoubleWritable(height),
				new IntWritable(weight), 
				new Text(sport),
				new IntWritable(gold),
				new IntWritable(silver),
				new IntWritable(bronze));
	}

	public AthletesCount(IntWritable id, Text name, Text nationality,
			Text sex, Text dob, DoubleWritable height, IntWritable weight,
			Text sport, IntWritable gold, IntWritable silver, IntWritable bronze) {
		set(id, name, nationality, sex, dob, height, weight, sport, gold, silver, bronze);
	}

	public void set(IntWritable id, Text name, Text nationality,
			Text sex, Text dob, DoubleWritable height, IntWritable weight,
			Text sport, IntWritable gold, IntWritable silver, IntWritable bronze) {
		this.id = id;
		this.name = name;
		this.nationality = nationality;
		this.sex = sex;
		this.dob = dob;
		this.height = height;
		this.weight = weight;
		this.sport = sport;
		this.gold = gold;
		this.silver = silver;
		this.bronze = bronze;
	}

	public IntWritable getId() {
		return id;
	}

	public Text getName() {
		return name;
	}

	public Text getNationality() {
		return nationality;
	}

	public Text getSex() {
		return sex;
	}

	public Text getDob() {
		return dob;
	}

	public DoubleWritable getHeight() {
		return height;
	}

	public IntWritable getWeight() {
		return weight;
	}

	public Text getSport() {
		return sport;
	}
	
	public IntWritable getGold() {
		return gold;
	}
	
	public IntWritable getSilver() {
		return silver;
	}
	
	public IntWritable getBronze() {
		return bronze;
	}

	@Override
	public void write(DataOutput out) throws IOException {
		id.write(out);
		name.write(out);
		nationality.write(out);
		sex.write(out);
		dob.write(out);				
		height.write(out);
		weight.write(out);
		sport.write(out);
		gold.write(out);
		silver.write(out);
		bronze.write(out);		
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		id.readFields(in);
		name.readFields(in);
		nationality.readFields(in);
		sex.readFields(in);
		dob.readFields(in);				
		height.readFields(in);
		weight.readFields(in);
		sport.readFields(in);
		gold.readFields(in);
		silver.readFields(in);
		bronze.readFields(in);
	}

	
	@Override
	public int compareTo(AthletesCount st) {
		int cmp = company.compareTo(st.getCompany());
		if (cmp != 0) {
			return cmp;
		}
		return day.compareTo(st.getDay());
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result	+ ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((nationality == null) ? 0 : nationality.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((dob == null) ? 0 : dob.hashCode());
		result = prime * result + ((height == null) ? 0 : height.hashCode());
		result = prime * result + ((weight == null) ? 0 : weight.hashCode());
		result = prime * result + ((sport == null) ? 0 : sport.hashCode());
		result = prime * result + ((gold == null) ? 0 : gold.hashCode());
		result = prime * result + ((silver == null) ? 0 : silver.hashCode());
		result = prime * result + ((bronze == null) ? 0 : bronze.hashCode());
		return result;
	}

	
}