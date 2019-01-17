/**
 * @fileoverview /admin_users/:admin_user_id/*のHTMLページで使用する処理
 */

/**
 * タブ要素(input)のchecked状態を切り替えるための処理
 * @param none
 * @returns {boolean} 対象の要素にchecked属性を追加できたかどうか
 */
let changeTab = () => {
  let path = location.pathname
  let pathArr = path.split('/')
  if(pathArr[pathArr.length - 2] == 'media'){
    var currentPage = pathArr[pathArr.length - 2]
  }else if(pathArr[pathArr.length - 2] == 'articles'){
    var currentPage = pathArr[pathArr.length - 2].replace(/_/g, '-')
  }else{
    var currentPage = pathArr[pathArr.length - 1].replace(/_/g, '-')
  }
  let el = document.getElementById(currentPage)
  el.setAttribute('checked', true)
}

changeTab()
