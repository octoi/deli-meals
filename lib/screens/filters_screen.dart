import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function setFilters;

  const FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFree;
  late bool _lactoseFree;
  late bool _vegan;
  late bool _vegetarian;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'] ?? false;
    _lactoseFree = widget.filters['lactose'] ?? false;
    _vegan = widget.filters['vegan'] ?? false;
    _vegetarian = widget.filters['vegetarian'] ?? false;
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (newVal) => updateValue(newVal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Glute-free',
                  'Only Include gluten-free meals',
                  _glutenFree,
                  (newVal) => setState(() => _glutenFree = newVal),
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only Include lactose-free meals',
                  _lactoseFree,
                  (newVal) => setState(() => _lactoseFree = newVal),
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only Include vegetarian meals',
                  _vegetarian,
                  (newVal) => setState(() => _vegetarian = newVal),
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only Include vegan meals',
                  _vegan,
                  (newVal) => setState(() => _vegan = newVal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
