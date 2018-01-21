function CategoriesTable(props) {
  return (
    <table className="category-table">
      <colgroup>
        <col />
        <col />
        <col />
      </colgroup>
      <thead>
        <tr>
          <th>Category</th>
          <th>Budget</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {
          props.categories.map((category, i) =>
            <tr key={i}>
              <td>{category.name}</td>
              <td>{category.budget.toLocaleString('en-US', { style: 'currency', currency: 'USD' })}</td>
              <td><button className="danger" onClick={props.handleRemove} data-category-id={category.id}>x</button></td>
            </tr>
          )
        }
      </tbody>
    </table>
  )
}
