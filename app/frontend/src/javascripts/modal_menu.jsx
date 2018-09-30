import $ from 'jquery'

$('.kp-menu').on('click', () => {
  $('.modal').append('<div class="kp-menu-modal-bg"></div>')
  $('.kp-menu-modal').css({ "display": "flex" })
  modalCentering()
  $('.kp-menu-modal, .kp-menu-modal-bg').fadeIn('slow')
})

$('.modal').on('click', () => {
  $('.kp-menu-modal-bg, .kp-menu-modal').fadeOut('slow', () => {
    $('.kp-menu-modal-bg').remove()
  })
})

const modalCentering = () => {
  const windowWidth = $(window).width()
  const windowHeight = $(window).height()
  const modalWidth = $('.kp-menu-modal').outerWidth()
  const modalHeight = $('.kp-menu-modal').outerHeight()

  const left = (windowWidth - modalWidth)/2
  const top = (windowHeight - modalHeight)/2

  console.log(`left:${left}, top:${top}`)

  $('.kp-menu-modal').css({
    "left": `${left}px`,
    "top": `${top}px`
  });
}