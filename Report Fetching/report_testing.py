import csv
import json

def save_to_csv(data, fieldnames, filename):
    with open(filename, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(data)

def process_json_and_save(json_file):
    players = []
    combine_test_reports = []
    strokes = []
    measurements = []
    
    with open(json_file, 'r') as file:
        data = json.load(file)
    
    player_ids = set()
    
    for stroke_group in data['StrokeGroups']:
        player = stroke_group['Player']
        
        if player['Id'] not in player_ids:
            player_data = {
                "id": player['Id'],
                "name": player['Name'],
                "email": player['Email'],
                "hcp": player['Hcp'],
                "gender": player['Gender'],
                "nationality": player['Nationality'],
                "birthday": player['Birthday'],
                "mailchimp": player['Properties'].get('MailChimp')
            }
            players.append(player_data)
            player_ids.add(player['Id'])
            print(f"Added player {player['Name']}")
        
        combine_test_report_data = {
            "id": stroke_group['Id'],
            "date": stroke_group['Date'],
            "target": stroke_group['Target'],
            "avg_score": stroke_group['AvgScore'],
            "avg_distance_from_pin": stroke_group.get('AvgDistanceFromPin', None),  # Handle missing AvgDistanceFromPin
            "player_id": player['Id']
        }
        print(f"adding data - target = {stroke_group['Target']}")
        combine_test_reports.append(combine_test_report_data)
        
        for stroke in stroke_group['Strokes']:
            stroke_data = {
                "id": stroke['Id'],
                "time": stroke['Time'],
                "club": stroke['Club'],
                "ball": stroke['Ball'],
                "combine_test_report_id": stroke_group['Id'],
                "score": stroke['Measurement']['Score'],
                "distance_from_pin": stroke['Measurement']['DistanceFromPin']
            }
            
            strokes.append(stroke_data)
            
            measurement_data = {
                "id": stroke['Measurement']['Id'],
                "stroke_id": stroke['Id'],
                "tee_position_x": stroke['Measurement']['TeePosition'][0],
                "tee_position_y": stroke['Measurement']['TeePosition'][1],
                "tee_position_z": stroke['Measurement']['TeePosition'][2],
                "player_dexterity": stroke['Measurement']['PlayerDexterity'],
                "dynamic_lie": stroke['Measurement']['DynamicLie'],
                "impact_offset": stroke['Measurement']['ImpactOffset'],
                "impact_height": stroke['Measurement']['ImpactHeight'],
                "attack_angle": stroke['Measurement']['AttackAngle'],
                "launch_direction": stroke['Measurement']['LaunchDirection'],
                "ball_speed": stroke['Measurement']['BallSpeed'],
                "club_path": stroke['Measurement']['ClubPath'],
                "club_speed": stroke['Measurement']['ClubSpeed'],
                "dynamic_loft": stroke['Measurement']['DynamicLoft'],
                "face_angle": stroke['Measurement']['FaceAngle'],
                "face_to_path": stroke['Measurement']['FaceToPath'],
                "launch_angle": stroke['Measurement']['LaunchAngle'],
                "smash_factor": stroke['Measurement']['SmashFactor'],
                "spin_axis": stroke['Measurement']['SpinAxis'],
                "spin_loft": stroke['Measurement']['SpinLoft'],
                "spin_rate": stroke['Measurement']['SpinRate'],
                "swing_direction": stroke['Measurement']['SwingDirection'],
                "swing_plane": stroke['Measurement']['SwingPlane'],
                "swing_radius": stroke['Measurement']['SwingRadius'],
                "dplane_tilt": stroke['Measurement']['DPlaneTilt'],
                "low_point_distance": stroke['Measurement']['LowPointDistance'],
                "low_point_height": stroke['Measurement']['LowPointHeight'],
                "low_point_side": stroke['Measurement']['LowPointSide'],
                "max_height": stroke['Measurement']['MaxHeight'],
                "carry": stroke['Measurement']['Carry'],
                "total": stroke['Measurement']['Total'],
                "carry_side": stroke['Measurement']['CarrySide'],
                "total_side": stroke['Measurement']['TotalSide'],
                "landing_angle": stroke['Measurement']['LandingAngle'],
                "hang_time": stroke['Measurement']['HangTime'],
                "last_data": stroke['Measurement']['LastData'],
                "curve": stroke['Measurement']['Curve'],
                "reduced_accuracy": ','.join(stroke['Measurement'].get('ReducedAccuracy', [])),
                "ball_trajectory": json.dumps(stroke['Measurement']['BallTrajectory']),
                "club_trajectory": json.dumps(stroke['Measurement']['ClubTrajectory']),
            }
            
            measurements.append(measurement_data)
    
    # Save each list to a CSV file
    save_to_csv(players, players[0].keys(), 'players.csv')
    save_to_csv(combine_test_reports, combine_test_reports[0].keys(), 'combine_test_reports.csv')
    save_to_csv(strokes, strokes[0].keys(), 'strokes.csv')
    save_to_csv(measurements, measurements[0].keys(), 'measurements.csv')

# Process the JSON file and save to CSV
process_json_and_save('report.txt')