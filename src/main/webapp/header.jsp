

<div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
    <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
            id="bd-theme"
            type="button"
            aria-expanded="false"
            data-bs-toggle="dropdown"
            aria-label="Toggle theme (auto)">
        <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
            <use href="#circle-half"></use>
        </svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
    </button>
    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light"
                    aria-pressed="false">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#sun-fill"></use>
                </svg>
                Light
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark"
                    aria-pressed="false">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#moon-stars-fill"></use>
                </svg>
                Dark
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto"
                    aria-pressed="true">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#circle-half"></use>
                </svg>
                Auto
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
    </ul>
</div>
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">Overview</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Inventory</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Customers</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Products</a></li>
            </ul>

            <% if (userAdapter.isAuthorized((User) request.getSession().getAttribute("User"))){%>

            <div class="dropdown text-end" id="userBtn">
                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${sessionScope.User.imgSrc}" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my">Профиль</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tasks?type=onLearn">На изучении ${sessionScope.User.tasksOnWay}</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}$/tasks?type=comleted">Изучено ${sessionScope.User.tasksCompleted}</a></li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signOut" id="signOutBtn">Sign out</a></li>
                </ul>
            </div>
            <%}else {%>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signUpForm"
                    id="signUpBtn">
                Sign-Up
            </button>
            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#signInForm" id="signInBtn">
                Sign-In
            </button>
            <%}%>
        </div>
    </div>
</header>

<div class="modal fade" aria-hidden="true" tabindex="-1" aria-labelledby="signUpFormTitle" role="dialog"
     id="signUpForm">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2" id="signUpFormTitle">Sign up for free</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="signUpName"
                               placeholder="bob">
                        <label for="signUpName">Name</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="signUpEmail"
                               placeholder="name@calanco.com">
                        <label for="signUpEmail">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="signUpPassword"
                               placeholder="Password">
                        <label for="signUpPassword">Password</label>
                    </div>
                    <label for="exampleColorInput" class="form-label">Color picker</label>
                    <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#563d7c" title="Choose your color">
                    <button id="signUpFormBtn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button">Sign up</button>
                    <small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" aria-hidden="true" tabindex="-1" aria-labelledby="signInFormTitle" role="dialog"
     id="signInForm">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2" id="signInFormTitle">Sign in</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="signInEmail"
                               placeholder="name@example.com">
                        <label for="signInEmail">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="signInPassword"
                               placeholder="Password">
                        <label for="signInPassword">Password</label>
                    </div>
                    <button id="signInFormBtn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>
    <jsp:include page="js/jquery-3.7.1.min.js"/>
    <jsp:include page="js/bootstrap.bundle.min.js"/>
    <jsp:include page="js/color-modes.js"/>
    <jsp:include page="js/index.js"/>
</script>

