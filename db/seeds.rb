require 'json'
response = RestClient.get("https://data.medicare.gov/resource/c8qv-268j.json?cty=HOUSTON&st=TX&$limit=5000")
# response = RestClient.get("https://data.medicare.gov/resource/c*qv-268j.json")
doctors = JSON.parse(response.body)

doctors.each do | doctor |
	Doctor.create({
		first_name: doctor["frst_nm"],
		last_name: doctor["lst_nm"],
		specialty: doctor["pri_spec"],
		city: doctor["cty"],
		state: doctor["st"]
	})
end