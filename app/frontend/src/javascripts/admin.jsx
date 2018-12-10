/**
 * @fileoverview /admin_users/:admin_user_id/*のHTMLページで使用する処理
 */

/**
 * タブ要素(input)がクリックされたときに、ページ遷移するための処理
 * @param {event} e クリックされた際のMouseEvent
 * @returns {boolean} Window.location.hrefで遷移できたかどうか
 */
let transition = (e) => {
  let dest = e.target.getAttribute('id').replace(/-/g, '_')
  if(dest){
    window.location.href = './' + dest
  }
}

/**
 * タブ要素(input)のchecked状態を切り替えるための処理
 * @param none
 * @returns {boolean} 対象の要素にchecked属性を追加できたかどうか
 */
let changeTab = () => {
  let path = location.pathname
  let pathArr = path.split('/')
  let currentPage = pathArr[pathArr.length - 1].replace(/_/g, '-')
  let el = document.getElementById(currentPage)
  el.setAttribute('checked', true)
}

changeTab()
document.addEventListener('click', transition)