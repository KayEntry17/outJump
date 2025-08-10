extends Node
const url_submit="https://docs.google.com/forms/u/0/d/e/1FAIpQLSfzqVAKp0LrtlxCyKgr9Ol_y85PyU6eO_uMPK_2-id1ANhMyQ/formResponse"
const url_data="https://opensheet.elk.sh//1yT_n7sMI_2J7JazPiKxnuWaQAIyqN4m99B2IPnnKeFI/data"
const headers=["Content-Type: application/x-www-form-urlencoded"]
var client=HTTPClient.new()
var namepl="TheLastYatagarasu"
#entry.1679080871
#JohnPersona
#entry.791717199
#100
#entry.165788207
var leaderb:Array
var leaderbsort:Dictionary

func sort_ascending(a, b):
	if str(a[1]) < str(b[1]):
		return true
	return false
func _ready() -> void:
	#add("asdcad","1c00","2")
	leaderb=[]
	refresh()
func http_submit(_result,_responce_code,_headers,_body):
	leaderbsort={}
	leaderb=[]

	#http.queue_free()
	#print(73456387)
	if !_result:
		var data=JSON.parse_string(_body.get_string_from_utf8())
		#print(data)
		for n in data:
			leaderb.append([n["Name"],n["Time"],n["leaderboardid"]])
		for n in leaderb:
			if !leaderbsort.has(n[2]):
				leaderbsort[n[2]]=[]
			leaderbsort[n[2]].append(n)
		for n in leaderbsort:
			leaderbsort[n].sort_custom(sort_ascending)
		print(leaderbsort)
		

		#leaderb=_body.get_string_from_utf8()
		
	#print(leaderb)
	pass
func add(name, time, mapid):
	var ht=HTTPRequest.new()
	#ht.request_completed.connect(http_submit)
	var user_data=client.query_string_from_dict({
		"entry.1679080871":name,
		"entry.791717199":time,
		"entry.1657882079":mapid
	})
	add_child(ht)
	var err=ht.request(url_submit,headers,HTTPClient.METHOD_POST,user_data)
	if err:
		ht.queue_free()
func refresh():

	var ht=HTTPRequest.new()
	ht.request_completed.connect(http_submit)
	add_child(ht)
	var err=ht.request(url_data,headers,HTTPClient.METHOD_GET)
	if err:
		ht.queue_free()
	#print(leaderb)

		
