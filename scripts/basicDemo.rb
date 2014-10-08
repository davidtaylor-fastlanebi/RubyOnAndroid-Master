# this file is basicDemo.rb

		# this makes java_import work
include Java

		# java_import tells JRuby about Java classes that you want to use
		# these are Android widgets
java_import 'android.widget.LinearLayout'
java_import 'android.widget.Button'
java_import 'android.widget.TextView'
# david debug - java_import 'android.widget.EditText'

class JRonA

#======================

	# onPause is triggered when the user leaves JRonA for another application
	def onPause
		puts "Oh why have you abandoned me?"
	end # onPause

#======================

	def startDemo
	
		setupLayouts
		jronaSetContentView(@lay)
	
	end # startDemo

#======================

	def updateTime
	
		tm = Time.now
		@timeVu.setText(tm.strftime("%d %b %Y  %H:%M:%S"))
	
	end # updateTime

#=======================

#======================

	def updateText

		edit = @edit.getText()
		@lbl.setText(edit)

	end # updateText

#=======================

	def setupLayouts
  
    @lay = LinearLayout.new(@activity)
    @lay.setOrientation(LinearLayout::VERTICAL)

    @lbl = TextView.new(@activity)
    @lbl.setText('Hello from ITFlexSolutions')

# david debug -     @edit = EditText.new(@activity)
    
    tm = Time.now
    @timeVu = TextView.new(@activity)
    @timeVu.setText(tm.strftime("%d %b %Y  %H:%M:%S"))

        @btnTime = Button.new(@activity)
    	@btnTime.setText("Update Time")
    	@btnTime.setOnClickListener(proc { updateTime })

		@btnText = Button.new(@activity)
		@btnText.setText("Update Text")
		@btnText.setOnClickListener(proc { updateTime }) # david debug - should read updateText
    
    @lay.addView(@lbl)
# david debug -     @lay.addView(@edit)
    @lay.addView(@timeVu)
    @lay.addView(@btnTime)
    @lay.addView(@btnText)
    
  end # setupLayouts

#======================
end # class JRonA
