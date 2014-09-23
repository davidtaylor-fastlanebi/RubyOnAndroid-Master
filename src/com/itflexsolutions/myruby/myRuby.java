package com.itflexsolutions.myruby;

import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;

// import android.util.Log;

import org.jruby.embed.ScriptingContainer;
import org.jruby.embed.PathType;
import org.jruby.embed.LocalVariableBehavior;
import org.jruby.CompatVersion;

import java.lang.Runnable;
import java.lang.Thread;

public class myRuby extends Activity {
	public static ScriptingContainer container;
	public static Activity actThis;
	public static Object jronaClass;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		// Log.e("JRonA", "Java - onCreate");
		actThis = this;
		Runnable bjr = new Runnable() {
			public void run() {
				final String filename = "JRonA.rb";
				System.setProperty("jruby.interfaces.useProxy", "true");
				System.setProperty("jruby.bytecode.version", "1.5");
				container = new ScriptingContainer(LocalVariableBehavior.GLOBAL);
				container.setCompatVersion(CompatVersion.RUBY1_9);
				container.put("activityThis", actThis); // will be picked up by
														// JRonA.rb
				jronaClass = container.runScriptlet(PathType.CLASSPATH,
						filename);
				// final String method = "getJRonA";
				// jronaClass = container.callMethod(baseClass, method,
				// Object.class);
			}
		};
		bigThread(bjr);
		setContentView(R.layout.main);
	}

	@Override
	public void onActivityResult(final int requestCode, final int resultCode,
			final Intent data) {
		// Log.e("JRonA", "Java - onActivityResult");
		Runnable clonAct = new Runnable() {
			public void run() {
				String method = "onActivityResult";
				Object[] args = new Object[3];
				args[0] = requestCode;
				args[1] = resultCode;
				args[2] = data;
				container.callMethod(jronaClass, method, args, String.class);
			}
		};
		bigThread(clonAct);
	}

	@Override
	protected void onPause() {
		super.onPause();
		// Log.e("JRonA", "JAVA - onPause");
		Runnable clonP = new Runnable() {
			public void run() {
				String method = "onPause";
				container.callMethod(jronaClass, method, String.class);
			}
		};
		bigThread(clonP);
	}

	public void bigThread(Runnable rbl) {
		Thread jthr = new Thread(null, rbl, "jrThr", 64 * 1024);
		jthr.start();
	}
}
