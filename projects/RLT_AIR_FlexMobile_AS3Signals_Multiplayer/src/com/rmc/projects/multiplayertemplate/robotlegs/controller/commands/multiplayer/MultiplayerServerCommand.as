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
package com.rmc.projects.multiplayertemplate.robotlegs.controller.commands.multiplayer
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.multiplayertemplate.robotlegs.model.events.multiplayer.MultiplayerServerEvent;
	import com.rmc.projects.multiplayertemplate.robotlegs.services.multiplayer.IMultiplayerService;
	
	import org.robotlegs.mvcs.Command;
	
	
	/**
	 * <p>Command: Loading the display text for the application</p>
	 * 
	 */
	public class MultiplayerServerCommand extends Command
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * Event: 
		 * 
		 */	
		[Inject]
		public var multiplayerServerEvent : MultiplayerServerEvent;
		
		/**
		 * Service: 
		 * 
		 */	
		[Inject (name="MultiplayerService")]
		public var iMultiplayerService : IMultiplayerService;
		
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
			switch (multiplayerServerEvent.type) {
				case MultiplayerServerEvent.CONNECT:
					iMultiplayerService.connect(multiplayerServerEvent.server, multiplayerServerEvent.port);
					break;
				case MultiplayerServerEvent.DISCONNECT:
					iMultiplayerService.disconnect();
					break;
				default:
					throw new SwitchStatementDefaultError ();
					break;
			}
			
		}
	}
}