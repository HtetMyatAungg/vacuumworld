import json

o = json.loads(open('UROP/Percepts/event_percepts.json').read())


seen = dict()
for item in o:
    for direction, cell in item['grid'].items():
        if cell is None:
            continue
        coord = tuple(cell['coord'])
        if coord in seen and set(seen[coord]['walls']) != set(cell['walls']):
            print("conflict at", coord, seen[coord]['walls'], "vs", cell['walls'])
        agent = cell['agent'] if cell['agent'] else None
        seen[coord] = {'coord': list(coord), 'walls': cell['walls'], 'dirt': cell['dirt'], 'agent': agent}

result = list(seen.values())
with open("UROP/Percepts/dudece.json", "w") as f:
    json.dump(result, f, indent=2)