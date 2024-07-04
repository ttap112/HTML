document.addEventListener('DOMContentLoaded', function() {
  let lastScrollTop = 0;
  const menuBar = document.querySelector('.MenuBar');

  window.addEventListener('scroll', function() {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    if (scrollTop > lastScrollTop) {
      menuBar.style.top = '-60px';
    } else {
      menuBar.style.top = '0';
    }
    lastScrollTop = scrollTop;
  });

  const menuTrigger = document.querySelector('.menu-trigger');
  const bar = document.querySelector('.Bar');

  menuTrigger.addEventListener('click', function(e) {
    e.preventDefault();
    this.classList.toggle('active');
    bar.classList.toggle('active');
  });

  const menus = document.querySelectorAll('.menu');

  menus.forEach(menu => {
    const submenu = menu.querySelector('.submenu') || menu.querySelector('.submenu1');

    menu.addEventListener('click', function(e) {
      e.stopPropagation();
      if (submenu) {
        if (submenu.classList.contains('open')) {
          submenu.classList.remove('open');
        } else {
          document.querySelectorAll('.submenu.open, .submenu1.open').forEach(s => {
            s.classList.remove('open');
          });
          submenu.classList.add('open');
        }
      }
    });
  });

  document.addEventListener('click', function(e) {
    if (!document.querySelector('.MenuBar').contains(e.target)) {
      document.querySelectorAll('.submenu.open, .submenu1.open').forEach(submenu => {
        submenu.classList.remove('open');
      });
    }
  });

  const mainTitle = document.querySelector('.MainTitle');
  let isHidden = false;
  
  setInterval(function() {
    if (isHidden) {
      mainTitle.classList.remove('hidden');
    } else {
      mainTitle.classList.add('hidden');
    }
    isHidden = !isHidden;
  }, 6000);  
});
