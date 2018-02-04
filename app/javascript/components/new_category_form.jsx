import React from "react";

export default function NewCategoryForm(props) {
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
            <td><input type="number" name="budget" min="0" step="0.01" /><span>{props.budgetError}</span></td>
            <td><input type="submit" value="+" /></td>
          </tr>
        </tbody>
      </table>
    </form>
  )
}
