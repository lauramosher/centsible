function NewCategoryForm(props) {
  return (
    <form id="addCategoryForm" onSubmit={props.handler}>
      <table className="category-table">
        <colgroup>
          <col />
          <col />
          <col />
        </colgroup>
        <tbody>
          <tr>
            <td><input type="text" name="name" /><span>{props.nameError}</span></td>
            <td><input type="number" name="budget" min="0" /><span>{props.budgetError}</span></td>
            <td><input type="submit" value="Add" /></td>
          </tr>
        </tbody>
      </table>
    </form>
  )
}

