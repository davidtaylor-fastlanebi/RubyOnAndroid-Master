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

		priceFirst = @editTextFirst.getText().to_s #    David debug - babby steps
		priceSecond = @editTextSecond.getText().to_s #  David debug - babby steps

		if priceFirst.to_f * priceSecond.to_f > 0   # only update exotics if both candidates have valid prices

        # calculate probability of a win by First and Second Candidates
        @ROI = 0.75  # Return on average dollar invested into TAB is 85% but only near jump. prior approx say 75%
        pF1 = 1/(1+(priceFirst.to_f-1)/@ROI)  # probability of First wining the event to end in position 1
		pS1 = 1/(1+(priceSecond.to_f-1)/@ROI) # probability of Second winning the event alternatively in position 1


        # Scenario A -  First wins and Second comes next - calculate the probability of Second ending in position 2
        pS2 = pS1 / (1-pF1)

        # Scenario B -  Second wins and First comes next- calculate the probability of First ending in position 2
        pF2 = pF1 / (1-pS1)

        # Calculate Exotic probabilities for Scenarios A and B
		pExactaA = pF1 * pS2
		pExactaB = pS1 * pF2

		pQuinella = pExactaA + pExactaB

		# Calculate Exotic break even price
		bEvenExactaA =  (1/ pExactaA-1)
		bEvenExactaB =  (1/ pExactaB-1)
		bEvenQuinella =  (1/ pQuinella-1)

		@calcE.setText("Exacta break even price is $  #{bEvenExactaA}")
		@calcQ.setText("Quinella break even price is $  #{bEvenQuinella}")

        end # if valid prices

	end # updateExotics

#======================

	def updateWinPriceFirst

        if @editTextFirst.hasFocus()
		    @editTextFirst.setText("")
		    end
		 @TYPE_NUMBER_FLAG_DECIMAL = 8192 # for decimal
		 @editTextFirst.setRawInputType(@TYPE_NUMBER_FLAG_DECIMAL)

		puts "First"

	end # updateWinPriceFirst

#======================

	def updateWinPriceSecond

       if @editTextSecond.hasFocus()
		    @editTextSecond.setText("")
		    end
		@TYPE_NUMBER_FLAG_DECIMAL = 8192 # for decimal
	    @editTextSecond.setRawInputType(@TYPE_NUMBER_FLAG_DECIMAL)

		puts "Second"

	end # updateWinPriceSecond

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

	@editTextFirst.setOnFocusChangeListener(proc { updateWinPriceFirst })
    @editTextSecond.setOnFocusChangeListener(proc { updateWinPriceSecond })

  end # setupLayouts

#======================
end # class JRonA
