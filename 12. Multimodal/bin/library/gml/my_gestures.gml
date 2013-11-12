<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage xmlns:gml="http://gestureworks.com/gml/version/1.0">
	
	<Gesture_set gesture_set_name="mutimodal-gestures">
		
		<Gesture id="n-manipulate-boundary" type="manipulate">
			<match>
				<action>
					<initial>
						<cluster point_number="0" point_number_min="1" point_number_max="10"/>
					</initial>
				</action>
			</match>	
			<analysis>
				<algorithm class="kinemetric" type="continuous">
					<library module="manipulate"/>
					<returns>
						<property id="dx" result="dx"/>
						<property id="dy" result="dy"/>
						<property id="dsx" result="ds"/>
						<property id="dsy" result="ds"/>
						<property id="dtheta" result="dtheta"/>
					</returns>
				</algorithm>
			</analysis>	
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event  type="manipulate">
						<property ref="dx" target="x"/>
						<property ref="dy" target="y"/>
						<property ref="dsx" target="scaleX" min=".5" max="2" />
						<property ref="dsy" target="scaleY" min=".5" max="2" />
						<property ref="dtheta" target="rotation"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
			
		<Gesture id="3dmotion-2-pinch-2dscale" type="motion_scale">
				<match>
					<action>
						<initial>
							<cluster type="pinch" input_type="motion" point_number="2" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="3d_kinemetric" type="continuous">
						<library module="3d_separate"/>
						<returns>
							<property id="dsx" result="ds"/>
							<property id="dsy" result="ds"/>
						</returns>
					</algorithm>
				</analysis>	
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event type="motion_scale">
							<property ref="ds" target="scaleX"/>
							<property ref="ds" target="scaleY"/>
						</gesture_event>
					</update>
				</mapping>
		</Gesture>	
		
		<Gesture id="3dmotion-1-trigger-2dtranslate" type="motion_drag">
				<match>
					<action>
						<initial>
							<cluster type="trigger" input_type="motion" point_number="1" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="3d_kinemetric" type="continuous">
						<library module="3d_translate"/>
						<returns>
							<property id="dx" result="dx"/>
							<property id="dy" result="dy"/>
						</returns>
					</algorithm>
				</analysis>	
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event type="motion_drag">
							<property ref="dx" target="x"/>
							<property ref="dy" target="y"/>
						</gesture_event>
					</update>
				</mapping>
		</Gesture>		
		
<Gesture id="3dmotion-1-pinch-2dtranslate" type="motion_drag">
							<match>
								<action>
									<initial>
										<cluster type="pinch" input_type="motion" point_number="1" point_number_min="1" point_number_max="10"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="3d_kinemetric" type="continuous">
									<library module="3d_translate"/>
									<returns>
										<property id="dx" result="dx"/>
										<property id="dy" result="dy"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="motion_drag">
										<property ref="dx" target="x"/>
										<property ref="dy" target="y"/>
									</gesture_event>
								</update>
							</mapping>
					</Gesture>		
												
	</Gesture_set>	
	
</GestureMarkupLanguage>