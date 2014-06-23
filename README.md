YYScrollingTableViewCell
========================

This's a simple example of horizontal scroll on a table view cell. It's using a collection view for each

# Structure

<pre>
UITableView (vertical scrolling)
    |-- UITableViewCell (normal cell)
    |   |-- a custom view (xib)
    |
    |-- YYScrollingTableViewCell
    |   |-- UICollectionView
    |   |   |-- UICollectionViewCell
    |   |       |-- a custom view (xib)
    |   |
    |   |-- UIScrollView (paging scroll view)
</pre>

# Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

**Anyway, This's just a simple example**

# License

It's available under the MIT license. See the LICENSE file for more info.
