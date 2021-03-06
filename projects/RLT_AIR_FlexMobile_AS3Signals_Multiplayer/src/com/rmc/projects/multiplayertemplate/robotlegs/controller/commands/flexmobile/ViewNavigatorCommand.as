/**
 * Copyright (C) 2005-2011 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:                                            
 *                                                                      
 * The above copyright notice and this permission notice shall be       
 * included in all copies or substantial portions of the Software.      
 *                                                                      
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,      
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF   
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR    
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.                                      
 */
//Marks the right margin of code *******************************************************************
package com.rmc.projects.multiplayertemplate.robotlegs.controller.commands.flexmobile
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.multiplayertemplate.robotlegs.controller.events.ViewNavigatorEvent;
	
	import mx.core.FlexGlobals;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.ViewNavigatorApplication;
	
	
	/**
	 * <p>Command: Loading the display text for the application</p>
	 * 
	 */
	public class ViewNavigatorCommand extends Command
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * Event: 
		 * 
		 */	
		[Inject]
		public var viewNavigatorEvent : ViewNavigatorEvent
		
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Robotlegs Requirement: Execute the command
		 * 
		 * @return void
		 *
		 */
		override public function execute():void
		{
			switch (viewNavigatorEvent.type) {
				case ViewNavigatorEvent.PUSH_VIEW:
					(FlexGlobals.topLevelApplication as ViewNavigatorApplication).navigator.pushView(viewNavigatorEvent.viewClass, null, null, viewNavigatorEvent.viewTransition);
					break;
				case ViewNavigatorEvent.POP_VIEW:
					(FlexGlobals.topLevelApplication as ViewNavigatorApplication).navigator.popView(viewNavigatorEvent.viewTransition);
					break;
				default:
					throw new SwitchStatementDefaultError ();
					break;
			}
			
		}
		
		
		
	}
}