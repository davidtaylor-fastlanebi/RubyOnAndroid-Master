# this file is basicDemo.rb
# changes for TAB Exacta & Qunella fair value application
#

		# this makes java_import work
include Java

		# java_import tells JRuby about Java classes that you want to use
		# these are Android widgets
java_import 'android.widget.LinearLayout'
java_import 'android.widget.Button'
java_import 'android.widget.TextView'
java_import 'android.widget.EditText'

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

	def updateExotics

		exacta = @editTextFirst.getText() #    David debug - babby steps
		quinella = @editTextSecond.getText() #  David debug - babby steps

		@calcE.setText(exacta)
		@calcQ.setText(quinella)

	end # updateExotics



#=======================
	def setupLayouts
  
    @lay = LinearLayout.new(@activity)
    @lay.setOrientation(LinearLayout::VERTICAL)

    @editTextFirst = EditText.new(@activity)
    @editTextFirst.setText("Type here, the win price for First Place")

 	@btnFirst = Button.new(@activity)
    @btnFirst.setText("Update win price First")

    @editTextSecond = EditText.new(@activity)
    @editTextSecond.setText("Type here, the win price for Second Place")

  	@btnSecond = Button.new(@activity)
    @btnSecond.setText("Update win price Second")

    @calcE = TextView.new(@activity)
    @calcE.setText("Racing Exacta Calculator fair value")

    @calcQ = TextView.new(@activity)
    @calcQ.setText("Racing Quinella Calculator fair value")

    @lay.addView(@editTextFirst)
    @lay.addView(@btnFirst)
    @lay.addView(@editTextSecond)
    @lay.addView(@btnSecond)
    @lay.addView(@calcE)
    @lay.addView(@calcQ)

 	@btnFirst.setOnClickListener(proc { updateExotics })
	@btnSecond.setOnClickListener(proc { updateExotics })

  end # setupLayouts

#======================
end # class JRonA
