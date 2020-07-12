extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
	if OS.get_name()=="HTML5":
		OS.set_window_maximized(true)
	
	addLog("Javascript Feature: " + str(OS.has_feature('JavaScript')))


var time_passed = 0
var calls_per_sec = 20
var time_for_one_call = 1 / calls_per_sec 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time_passed += delta

	if time_passed >= time_for_one_call:
		var ret = JavaScript.eval("EGB.input.shift()")
		if ret != null:
			addLog("EGB Input Queue:")
			addLog(str(ret))
			
			if ret == "c|red":
				$colorRect.color = Color.red
				
			if ret == "c|green":
				$colorRect.color = Color.green
			
		time_passed -= time_for_one_call 

func addLog(text):
	$Log.text = $Log.text + "\n" + text
	$Log.scroll_vertical = INF
	
func _on_btnEval_pressed():
	addLog("EVAL: " + $txtEval.text)
	var ret = JavaScript.eval($txtEval.text)
	addLog("Return: " + str(ret))


func _on_btnOutputTime_pressed():
	var timeDict = OS.get_time();
	var hour = timeDict.hour;
	var minute = timeDict.minute;
	var seconds = timeDict.second;

	var ret = JavaScript.eval('EGB.output.push("' + str(OS.get_time()) + '")')
	addLog("EGB Output Queue: " + str(OS.get_time()) )


func _on_btnEval2_pressed():
	var ret = JavaScript.eval('EGB.output.push("' + $txtOut.text + '")')
	addLog("EGB Output Queue: " + $txtOut.text  + " (as Text)")


func _on_btnEval3_pressed():
	var ret = JavaScript.eval('EGB.output.push(' + $txtOutEval.text + ')')
	addLog("EGB Output Queue: " + $txtOutEval.text  + " (direct)")
