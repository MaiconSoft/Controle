extends Node

const SAVE_PATH = "res://settings.json"
const DEFAULT_DATA = {}
const CURRENT_DATABASE_VERSION = 0


func _ready():
	if LoadProperty("DATABASE_VERSION",0) != CURRENT_DATABASE_VERSION:
		StoreAll({"DATABASE_VERSION":CURRENT_DATABASE_VERSION})		
	pass

func StoreProperty(PropertyName:String, data=null):
	var savedData = LoadAll(DEFAULT_DATA)
	savedData[PropertyName] = data
	StoreAll(savedData)


func LoadProperty(PropertyName:String, default=null):
	var data = LoadAll(DEFAULT_DATA)	
	if (data.has(PropertyName)):
		return data[PropertyName]	
	return default
	

func StoreAll(data={}):
	var savefile = File.new()	
	savefile.open(SAVE_PATH, File.WRITE)
	
	var jstr = JSON.print(data)
	savefile.store_line(jstr)
	savefile.close()


func LoadAll(default):	
	var savefile = File.new()
	if not savefile.file_exists(SAVE_PATH):
		print("The save file does not exist.")
		return default		
	savefile.open(SAVE_PATH, File.READ)	
	var data = parse_json(savefile.get_as_text())
	savefile.close()
	return data
