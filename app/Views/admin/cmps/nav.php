<nav class="mt-2">
    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <?php
        $request = service('request');
        ?>
        <li class="nav-item">
            <a href="/" class="nav-link <?= !$request->uri->getSegment(1) ? 'active' : null; ?>">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>Dashboard</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="/users" class="nav-link <?= $request->uri->getSegment(1) == 'users' ? 'active' : null; ?>">
                <i class="nav-icon fas fa-users"></i>
                <p>Users</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="/estates" class="nav-link <?= $request->uri->getSegment(1) == 'estates' ? 'active' : null; ?>">
                <i class="nav-icon fas fa-cubes"></i>
                <p>Estates</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="/tags" class="nav-link <?= $request->uri->getSegment(1) == 'tags' ? 'active' : null; ?>">
                <i class="nav-icon fas fa-tags"></i>
                <p>Estate-Tags</p>
            </a>
        </li>        
        <li class="nav-item">
            <a href="/clients" class="nav-link <?= $request->uri->getSegment(1) == 'clients' ? 'active' : null; ?>">
            <i class="nav-icon fas fa-users"></i>
                <p>Clients</p>
            </a>
        </li>       
        <li class="nav-item">
            <a href="/clienttags" class="nav-link <?= $request->uri->getSegment(1) == 'clienttags' ? 'active' : null; ?>">
                <i class="nav-icon fas fa-tags"></i>
                <p>Client-Tags</p>
            </a>
        </li>
    </ul>
</nav>