import json
import re
sourcefile =open("test.json",'r')
elastic_list=[]
json_data= json.load(sourcefile)
detail=json_data["detail-type"]
autoscale_cause= json_data["detail"]["Cause"]
autoscale_group_name= json_data["detail"]["AutoScalingGroupName"]
autoscale_group_name=autoscale_group_name.rstrip('_0123456789')
instance_id= json_data["detail"]["EC2InstanceId"]


start = autoscale_cause.find('capacity from')
end = autoscale_cause.find('.', start)
currentInstanceSize =autoscale_cause[start:end]

new = [int(s) for s in currentInstanceSize.split() if s.isdigit()]
currentInstanceSize= new[-1]

elastic_list.append(detail)
elastic_list.append(instance_id)
elastic_list.append(autoscale_group_name)
elastic_list.append(currentInstanceSize)


if "user request" in autoscale_cause:
 cause="Manually Triggered"
 elastic_list.append(cause)
elif "policy scaleup" in autoscale_cause:
 cause="Autoscale Policy"
 elastic_list.append(cause)

print elastic_list
sourcefile.close()
