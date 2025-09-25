import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterChecked = false;
  var _lactoseFreeFilterChecked = false;
  var _vegetarianFilterChecked = false;
  var _veganFilterChecked = false;

  @override
  void initState() {
    super.initState();

    _glutenFreeFilterChecked = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeFilterChecked = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianFilterChecked = widget.currentFilters[Filters.vegetarian]!;
    _veganFilterChecked = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeFilterChecked,
            Filters.lactoseFree: _lactoseFreeFilterChecked,
            Filters.vegetarian: _vegetarianFilterChecked,
            Filters.vegan: _veganFilterChecked,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterChecked,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterChecked = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterChecked,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterChecked = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SwitchListTile(
              value: _vegetarianFilterChecked,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterChecked = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetatian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SwitchListTile(
              value: _veganFilterChecked,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterChecked = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
