<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
<head>

<%
	HttpSession sesion = request.getSession();
	String nombre = (String) sesion.getAttribute("nombreCompleto");
	String foto = (Integer) sesion.getAttribute("foto") + "";
	String nombrePerfil = (String) sesion.getAttribute("desPerfil");

	int tipo = 1;
	String skin = "default";

	if (nombre == null) {
		response.sendRedirect("login.jsp");
	} else {
		if (foto == "") {
			foto = "nofoto";
		}

		tipo = (Integer) sesion.getAttribute("tipo");
		switch (tipo) {
			case 1 :
				skin = "skin-1";
				break;
			case 2 :
				skin = "skin-2";
				break;
			default :
				skin = "default";
		}
	}
	String bandera = "";
	/* Aqui va el algoritmo para capturar el idioma de la pagina
	 */

	if (bandera.equals("us")) {
		bandera = "img/usa_flag.gif";
	} else {
		bandera = "img/pe_flag.gif";
	}
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- ########### Modificar Label -->
<title><fmt:message key="label.Contenido" /> - <%=nombre%></title>

<meta name="description" content="overview &amp; stats">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- basic styles -->
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">

<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->

<!-- fonts -->

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300">

<!-- ace styles -->

<link rel="stylesheet" href="css/ace.min.css">
<link rel="stylesheet" href="css/ace-rtl.min.css">
<link rel="stylesheet" href="css/ace-skins.min.css">

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="js/ace-extra.min.js"></script>
<style type="text/css"></style>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
<![endif]-->
</head>

<body class="navbar-fixed breadcrumbs-fixed <%=skin%>" style="">
<c:choose>
		<c:when test="${param.idioma != null}">
		<fmt:setLocale value="${param.idioma}" scope="session" />
		<c:set var="bandera" value="${param.idioma}" scope="session"></c:set>
		</c:when>
		<c:otherwise>
		<c:set var="bandera" value="${sessionScope['javax.servlet.jsp.jstl.fmt.locale.session']}" scope="session"></c:set>
		</c:otherwise>
	</c:choose>

	<div class="navbar navbar-default navbar-fixed-top" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="home.jsp" class="navbar-brand"> <i
					class="icon-tint lightcyan"></i> Sedapar <small class="light-blue"><%=nombrePerfil%>
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<!-- BARRA IDIOMA -->
					<li class="orange2"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <img src="img/${bandera}_flag.gif"
							class="msg-photo" alt="Idioma"> <span
							class="badge badge-grey"><fmt:message
									key="label.actualidioma" /></span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-ok"></i> <fmt:message
									key="label.seleccionaidioma" /></li>


							<li><a href="?idioma=es"> <img
									src="img/es_flag.gif" class="msg-photo" alt="Castellano">
									<span class="msg-body"> <span class="msg-title">
											<span class="blue"><fmt:message key="label.espaÃ±ol" /></span>
									</span>
								</span>
							</a></li>
							<li><a href="?idioma=en"> <img
									src="img/en_flag.gif" class="msg-photo" alt="Ingles"> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue"><fmt:message key="label.ingles" /></span>
									</span>
								</span>
							</a></li>

							<li><a href="#">
									<div class="progress progress-mini ">
										<div style="width: 100%"
											class="progress-bar progress-bar-danger"></div>
									</div>
							</a></li>
						</ul></li>
					<!-- FIN IDIOMA -->
					<li class="grey"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i class="icon-tasks"></i> <span
							class="badge badge-grey">2</span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-ok"></i> 4 <fmt:message
									key="label.tareapendientes" /></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"><fmt:message
												key="label.tareacontratos" /></span> <span class="pull-right">65%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width: 65%" class="progress-bar "></div>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"><fmt:message
												key="label.tareacambios" /></span> <span class="pull-right">35%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width: 35%"
											class="progress-bar progress-bar-danger"></div>
									</div>
							</a></li>

							<li><a href="procesos.jsp"> <fmt:message
										key="label.tareadetalles" /> <i class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="purple"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="icon-bell-alt icon-animated-bell"></i> <span
							class="badge badge-important">8</span>
					</a>

						<ul
							class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-warning-sign"></i>
								8 <fmt:message key="label.notificaciones" /></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-pink icon-comment"></i> New
											Comments
										</span> <span class="pull-right badge badge-info">+12</span>
									</div>
							</a></li>

							<li><a href="#"> <i
									class="btn btn-xs btn-primary icon-user"></i> Bob just signed
									up as an editor ...
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
											New Orders
										</span> <span class="pull-right badge badge-success">+8</span>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-info icon-twitter"></i>
											Followers
										</span> <span class="pull-right badge badge-info">+11</span>
									</div>
							</a></li>

							<li><a href="notificaciones.jsp"> <fmt:message
										key="label.notificacionesdetalles" /> <i
									class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="green"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="icon-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-envelope-alt"></i>
								5 <fmt:message key="label.mensajes" /></li>

							<li><a href="#"> <img src="img/users/avatar.png"
									class="msg-photo" alt="Alex&#39;s Avatar"> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue">Alex:</span> Ciao sociis natoque penatibus et
											auctor ...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>a
												moment ago</span>
									</span>
								</span>
							</a></li>

							<li><a href="#"> <img src="img/users/avatar3.png"
									class="msg-photo" alt="Susan&#39;s Avatar"> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue">Susan:</span> Vestibulum id ligula porta felis
											euismod ...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>20
												minutes ago</span>
									</span>
								</span>
							</a></li>

							<li><a href="#"> <img src="img/users/avatar4.png"
									class="msg-photo" alt="Bob&#39;s Avatar"> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue">Bob:</span> Nullam quis risus eget urna mollis
											ornare ...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>3:15
												pm</span>
									</span>
								</span>
							</a></li>

							<li><a href="buzon.jsp"> <fmt:message
										key="label.mensajestodos" /> <i class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="img/users/<%=foto%>.jpg" alt="Users Photo"> <span
							class="user-info"> <small><fmt:message
										key="label.bienvenido" />,</small> <%=nombre%>
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="configuracion.jsp"> <i class="icon-cog"></i>
									<fmt:message key="label.configuracion" />
							</a></li>

							<li><a href="perfil.jsp"> <i class="icon-user"></i> <fmt:message
										key="label.perfil" />
							</a></li>

							<li class="divider"></li>

							<li><a href="cerrarsesion"> <i class="icon-off"></i> <fmt:message
										key="label.cerrar" />
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar sidebar-fixed" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success"
							onclick="location.href='con_sol_revision.jsp';">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info"
							onclick="location.href='cc_sol_registro.jsp';">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning"
							onclick="location.href='man_clientes.jsp';">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger"
							onclick="location.href='rep_servicios.jsp';">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li><a href="home.jsp"> <i
							class="icon-dashboard"></i> <span class="menu-text"> <fmt:message
									key="label.resumen" />
						</span>
					</a></li>


					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-edit"></i> <span class="menu-text"><fmt:message
									key="label.Contratos" /> </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Solicitud" /> <b class="arrow icon-angle-down"></b>
							</a>

								<ul class="submenu">

									<li><a href="con_sol_revision.jsp"> <i class="icon-ok"></i>
											<fmt:message key="label.Revisar" />
									</a></li>

									<li><a href="con_sol_consulta.jsp"> <i
											class="icon-eye-open"></i> <fmt:message key="label.Buscar" />
									</a></li>
								</ul></li>

							<li><a href="con_contrato.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Generar" />
							</a></li>

							<li><a href="con_consulta.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Cc" />
							</a></li>


						</ul></li>


					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-share"></i> <span class="menu-text"><fmt:message
									key="label.Categoria" /> </span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="#" class="dropdown-toggle"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Solicitud" /><b class="arrow icon-angle-down"></b>
							</a>

								<ul class="submenu">
									<li><a href="cc_sol_registro.jsp"> <i
											class="icon-pencil"></i> <fmt:message key="label.Registrar" />
									</a></li>

									<li><a href="cc_sol_revision.jsp"> <i class="icon-ok"></i>
											<fmt:message key="label.Revisar" />
									</a></li>
								</ul></li>

							<li><a href="cc_ruta.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Ruta" />
							</a></li>

							<li><a href="cc_inspeccion.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Ii" />
							</a></li>

							<li><a href="cc_evaluar.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Ee" />
							</a></li>

							<li><a href="cc_validar.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Ve" />
							</a></li>


						</ul></li>

					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-dollar"></i> <span class="menu-text"> <fmt:message
									key="label.Liquidacion" />
						</span> <b class="arrow icon-angle-down"></b>
					</a>

						<ul class="submenu">
							<li><a href="liq_consulta.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Cd" />
							</a></li>

							<li><a href="liq_pago.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Rp" />
							</a></li>

						</ul></li>

					<li><a href="#reportes" class="dropdown-toggle"> <i
							class="icon-list-alt"></i> <span class="menu-text"> <fmt:message
									key="label.Reportes" />
						</span> <b class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<li><a href="rep_servicios.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Sc" />
							</a></li>

							<li><a href="rep_estadistica.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Edc" />
							</a></li>

						</ul></li>


					<li><a href="#mantenimiento" class="dropdown-toggle"> <i
							class="icon-group"></i> <span class="menu-text"> <fmt:message
									key="label.Mantenimiento" />
						</span> <b class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<li><a href="man_clientes.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Clientes" />
							</a></li>

							<li><a href="man_perfiles.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Perfiles" />
							</a></li>

							<li><a href="man_usuarios.jsp"> <i
									class="icon-double-angle-right"></i> <fmt:message
										key="label.Usuario" />
							</a></li>
						</ul></li>
					<li><a href="buzon.jsp"> <i class="icon-envelope-alt"></i>
							<span class="menu-text"> <fmt:message key="label.Buzon" />
								<span class="badge badge-primary ">5</span>
						</span>
					</a></li>
					<li><a href="calendario.jsp"> <i class="icon-calendar"></i>
							<span class="menu-text"><fmt:message
									key="label.Calendario" /> <span
								class="badge badge-transparent tooltip-error" title=""
								data-original-title="2Â ImportantÂ Events"> <i
									class="icon-warning-sign red bigger-130"></i>
							</span> </span>
					</a></li>

					<li><a href="timeline.jsp"> <i class="icon-code-fork"></i>
							<span class="menu-text"><fmt:message
									key="label.LineaTiempo" /> </span>
					</a></li>

					<li><a href="contenido.jsp"> <i class="icon-github"></i> <span
							class="menu-text"><fmt:message key="label.Contenido" /> </span>
					</a></li>
				</ul>
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content">
				<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="home.jsp">Home</a>
						</li>
						<!-- ########### Modificar Pagina -->
						<li class="active"><fmt:message key="label.Buzon" /></li>
					</ul>
					<!-- .breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off"> <i
								class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- #nav-search -->
				</div>

				<div class="page-content">
					<div class="page-header">
						<!-- ########### Modificar Pagina -->
						<h1> <fmt:message key="label.Buzon" />
							<small> <i class="icon-double-angle-right"></i> <fmt:message key="label.mensajestodos" /></small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							

							<div class="row">
									<div class="col-xs-12">
										<div class="tabbable">
											<ul id="inbox-tabs" class="inbox-tabs nav nav-tabs padding-16 tab-size-bigger tab-space-1">
												<li class="li-new-mail pull-right">
													<a data-toggle="tab" href="#write" data-target="write" class="btn-new-mail">
														<span class="btn bt1n-small btn-purple no-border">
															<i class=" icon-envelope bigger-130"></i>
															<span class="bigger-110">Write Mail</span>
														</span>
													</a>
												</li><!-- ./li-new-mail -->

												<li class="active">
													<a data-toggle="tab" href="#inbox" data-target="inbox">
														<i class="blue icon-inbox bigger-130"></i>
														<span class="bigger-110">Inbox</span>
													</a>
												</li>

												<li>
													<a data-toggle="tab" href="#sent" data-target="sent">
														<i class="orange icon-location-arrow bigger-130 "></i>
														<span class="bigger-110">Sent</span>
													</a>
												</li>

												<li>
													<a data-toggle="tab" href="#draft" data-target="draft">
														<i class="green icon-pencil bigger-130"></i>
														<span class="bigger-110">Draft</span>
													</a>
												</li>

												<li class="dropdown">
													<a data-toggle="dropdown" class="dropdown-toggle" href="#">
														<i class="pink icon-tags bigger-130"></i>

														<span class="bigger-110">
															Tags
															<i class="icon-caret-down"></i>
														</span>
													</a>

													<ul class="dropdown-menu dropdown-light-blue dropdown-125">
														<li>
															<a data-toggle="tab" href="#tag-1" data-target="tag-1">
																<span class="mail-tag badge badge-pink"></span>
																<span class="pink">Tag#1</span>
															</a>
														</li>

														<li>
															<a data-toggle="tab" href="#tag-family" data-target="tag-family">
																<span class="mail-tag badge badge-success"></span>
																<span class="green">Family</span>
															</a>
														</li>

														<li>
															<a data-toggle="tab" href="#tag-friends" data-target="tag-friends">
																<span class="mail-tag badge badge-info"></span>
																<span class="blue">Friends</span>
															</a>
														</li>

														<li>
															<a data-toggle="tab" href="#tag-work" data-target="tag-work">
																<span class="mail-tag badge badge-grey"></span>
																<span class="grey">Work</span>
															</a>
														</li>
													</ul>
												</li><!-- /.dropdown -->
											</ul>

											<div class="tab-content no-border no-padding">
												<div class="tab-pane in active">
													<div class="message-container">
														<div id="id-message-list-navbar" class="message-navbar align-center clearfix">
															<div class="message-bar">
																<div class="message-infobar" id="id-message-infobar">
																	<span class="blue bigger-150">Inbox</span>
																	<span class="grey bigger-110">(2 unread messages)</span>
																</div>

																<div class="message-toolbar hide">
																	<div class="inline position-relative align-left">
																		<a href="#" class="btn-message btn btn-xs dropdown-toggle" data-toggle="dropdown">
																			<span class="bigger-110">Action</span>

																			<i class="icon-caret-down icon-on-right"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter dropdown-caret dropdown-125">
																			<li>
																				<a href="#">
																					<i class="icon-mail-reply blue"></i>
																					&nbsp; Reply
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-mail-forward green"></i>
																					&nbsp; Forward
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-folder-open orange"></i>
																					&nbsp; Archive
																				</a>
																			</li>

																			<li class="divider"></li>

																			<li>
																				<a href="#">
																					<i class="icon-eye-open blue"></i>
																					&nbsp; Mark as read
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-eye-close green"></i>
																					&nbsp; Mark unread
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-flag-alt red"></i>
																					&nbsp; Flag
																				</a>
																			</li>

																			<li class="divider"></li>

																			<li>
																				<a href="#">
																					<i class="icon-trash red bigger-110"></i>
																					&nbsp; Delete
																				</a>
																			</li>
																		</ul>
																	</div>

																	<div class="inline position-relative align-left">
																		<a href="#" class="btn-message btn btn-xs dropdown-toggle" data-toggle="dropdown">
																			<i class="icon-folder-close-alt bigger-110"></i>
																			<span class="bigger-110">Move to</span>

																			<i class="icon-caret-down icon-on-right"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter dropdown-caret dropdown-125">
																			<li>
																				<a href="#">
																					<i class="icon-stop pink2"></i>
																					&nbsp; Tag#1
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop blue"></i>
																					&nbsp; Family
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop green"></i>
																					&nbsp; Friends
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop grey"></i>
																					&nbsp; Work
																				</a>
																			</li>
																		</ul>
																	</div>

																	<a href="#" class="btn btn-xs btn-message">
																		<i class="icon-trash bigger-125"></i>
																		<span class="bigger-110">Delete</span>
																	</a>
																</div>
															</div>

															<div>
																<div class="messagebar-item-left">
																	<label class="inline middle">
																		<input type="checkbox" id="id-toggle-all" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	&nbsp;
																	<div class="inline position-relative">
																		<a href="#" data-toggle="dropdown" class="dropdown-toggle">
																			<i class="icon-caret-down bigger-125 middle"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter dropdown-100">
																			<li>
																				<a id="id-select-message-all" href="#">All</a>
																			</li>

																			<li>
																				<a id="id-select-message-none" href="#">None</a>
																			</li>

																			<li class="divider"></li>

																			<li>
																				<a id="id-select-message-unread" href="#">Unread</a>
																			</li>

																			<li>
																				<a id="id-select-message-read" href="#">Read</a>
																			</li>
																		</ul>
																	</div>
																</div>

																<div class="messagebar-item-right">
																	<div class="inline position-relative">
																		<a href="#" data-toggle="dropdown" class="dropdown-toggle">
																			Sort &nbsp;
																			<i class="icon-caret-down bigger-125"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter pull-right dropdown-100">
																			<li>
																				<a href="#">
																					<i class="icon-ok green"></i>
																					Date
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-ok invisible"></i>
																					From
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-ok invisible"></i>
																					Subject
																				</a>
																			</li>
																		</ul>
																	</div>
																</div>

																<div class="nav-search minimized">
																	<form class="form-search">
																		<span class="input-icon">
																			<input type="text" autocomplete="off" class="input-small nav-search-input" placeholder="Search inbox ..." />
																			<i class="icon-search nav-search-icon"></i>
																		</span>
																	</form>
																</div>
															</div>
														</div>

														<div id="id-message-item-navbar" class="hide message-navbar align-center clearfix">
															<div class="message-bar">
																<div class="message-toolbar">
																	<div class="inline position-relative align-left">
																		<a href="#" class="btn-message btn btn-xs dropdown-toggle" data-toggle="dropdown">
																			<span class="bigger-110">Action</span>

																			<i class="icon-caret-down icon-on-right"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter dropdown-caret dropdown-125">
																			<li>
																				<a href="#">
																					<i class="icon-mail-reply blue"></i>
																					&nbsp; Reply
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-mail-forward green"></i>
																					&nbsp; Forward
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-folder-open orange"></i>
																					&nbsp; Archive
																				</a>
																			</li>

																			<li class="divider"></li>

																			<li>
																				<a href="#">
																					<i class="icon-eye-open blue"></i>
																					&nbsp; Mark as read
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-eye-close green"></i>
																					&nbsp; Mark unread
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-flag-alt red"></i>
																					&nbsp; Flag
																				</a>
																			</li>

																			<li class="divider"></li>

																			<li>
																				<a href="#">
																					<i class="icon-trash red bigger-110"></i>
																					&nbsp; Delete
																				</a>
																			</li>
																		</ul>
																	</div>

																	<div class="inline position-relative align-left">
																		<a href="#" class="btn-message btn btn-xs dropdown-toggle" data-toggle="dropdown">
																			<i class="icon-folder-close-alt bigger-110"></i>
																			<span class="bigger-110">Move to</span>

																			<i class="icon-caret-down icon-on-right"></i>
																		</a>

																		<ul class="dropdown-menu dropdown-lighter dropdown-caret dropdown-125">
																			<li>
																				<a href="#">
																					<i class="icon-stop pink2"></i>
																					&nbsp; Tag#1
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop blue"></i>
																					&nbsp; Family
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop green"></i>
																					&nbsp; Friends
																				</a>
																			</li>

																			<li>
																				<a href="#">
																					<i class="icon-stop grey"></i>
																					&nbsp; Work
																				</a>
																			</li>
																		</ul>
																	</div>

																	<a href="#" class="btn btn-xs btn-message">
																		<i class="icon-trash bigger-125"></i>
																		<span class="bigger-110">Delete</span>
																	</a>
																</div>
															</div>

															<div>
																<div class="messagebar-item-left">
																	<a href="#" class="btn-back-message-list">
																		<i class="icon-arrow-left blue bigger-110 middle"></i>
																		<b class="bigger-110 middle">Back</b>
																	</a>
																</div>

																<div class="messagebar-item-right">
																	<i class="icon-time bigger-110 orange middle"></i>
																	<span class="time grey">Today, 7:15 pm</span>
																</div>
															</div>
														</div>

														<div id="id-message-new-navbar" class="hide message-navbar align-center clearfix">
															<div class="message-bar">
																<div class="message-toolbar">
																	<a href="#" class="btn btn-xs btn-message">
																		<i class="icon-save bigger-125"></i>
																		<span class="bigger-110">Save Draft</span>
																	</a>

																	<a href="#" class="btn btn-xs btn-message">
																		<i class="icon-remove bigger-125"></i>
																		<span class="bigger-110">Discard</span>
																	</a>
																</div>
															</div>

															<div class="message-item-bar">
																<div class="messagebar-item-left">
																	<a href="#" class="btn-back-message-list no-hover-underline">
																		<i class="icon-arrow-left blue bigger-110 middle"></i>
																		<b class="middle bigger-110">Back</b>
																	</a>
																</div>

																<div class="messagebar-item-right">
																	<span class="inline btn-send-message">
																		<button type="button" class="btn btn-sm btn-primary no-border">
																			<span class="bigger-110">Send</span>

																			<i class="icon-arrow-right icon-on-right"></i>
																		</button>
																	</span>
																</div>
															</div>
														</div>

														<div class="message-list-container">
															<div class="message-list" id="message-list">
																<div class="message-item message-unread">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star orange2"></i>
																	<span class="sender" title="Alex John Red Smith">Alex John Red Smith </span>
																	<span class="time">1:33 pm</span>

																	<span class="summary">
																		<span class="text">
																			Click to open this message
																		</span>
																	</span>
																</div>

																<div class="message-item message-unread">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>

																	<span class="sender" title="John Doe">
																		John Doe
																		<span class="light-grey">(4)</span>
																	</span>
																	<span class="time">7:15 pm</span>

																	<span class="attachment">
																		<i class="icon-paper-clip"></i>
																	</span>

																	<span class="summary">
																		<span class="badge badge-pink mail-tag"></span>
																		<span class="text">
																			Clik to open this message right here
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Philip Markov">Philip Markov </span>
																	<span class="time">10:15 am</span>

																	<span class="attachment">
																		<i class="icon-paper-clip"></i>
																	</span>

																	<span class="summary">
																		<span class="message-flags">
																			<i class="icon-reply light-grey"></i>
																		</span>
																		<span class="text">
																			Photo booth beard raw denim letterpress vegan
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star orange2"></i>
																	<span class="sender" title="Sabrina">Sabrina </span>
																	<span class="time">Yesterday</span>

																	<span class="summary">
																		<span class="text">
																			Nullam quis risus eget urna mollis ornare
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Philip Markov">Philip Markov </span>
																	<span class="time">Yesterday</span>

																	<span class="attachment">
																		<i class="icon-paper-clip"></i>
																	</span>

																	<span class="summary">
																		<span class="badge badge-success mail-tag"></span>
																		<span class="text">
																			Vestibulum id ligula porta felis euismod
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Doctor Gomenz">Doctor Gomenz </span>
																	<span class="time">April 5</span>

																	<span class="summary">
																		<span class="text">
																			Vim te vivendo convenire, summo fuisset
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Robin Hood">Robin Hood </span>
																	<span class="time">April 4</span>

																	<span class="summary">
																		<span class="message-flags">
																			<i class="icon-reply light-grey"></i>
																		</span>
																		<span class="text">
																			No eos veniam equidem mentitum, his porro
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Google Inc">Google Inc </span>
																	<span class="time">April 3</span>

																	<span class="summary">
																		<span class="badge badge-grey mail-tag"></span>
																		<span class="text">
																			Convallis facilisis euismod urna sodales
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Shrek">Shrek </span>
																	<span class="time">March 28</span>

																	<span class="attachment">
																		<i class="icon-paper-clip"></i>
																	</span>

																	<span class="summary">
																		<span class="message-flags">
																			<i class="icon-flag icon-flip-horizontal light-grey"></i>
																		</span>
																		<span class="text">
																			Photo booth beard raw denim letterpress vegan messenger
																		</span>
																	</span>
																</div>

																<div class="message-item">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>

																	<i class="message-star icon-star-empty light-grey"></i>
																	<span class="sender" title="Yahoo!">Yahoo! </span>
																	<span class="time">March 27</span>

																	<span class="summary">
																		<span class="message-flags">
																			<i class="icon-mail-forward light-grey"></i>
																		</span>
																		<span class="text">
																			Tofu biodiesel williamsburg marfa, four loko mcsweeney
																		</span>
																	</span>
																</div>
															</div>
														</div><!-- /.message-list-container -->

														<div class="message-footer clearfix">
															<div class="pull-left"> 151 messages total </div>

															<div class="pull-right">
																<div class="inline middle"> page 1 of 16 </div>

																&nbsp; &nbsp;
																<ul class="pagination middle">
																	<li class="disabled">
																		<span>
																			<i class="icon-step-backward middle"></i>
																		</span>
																	</li>

																	<li class="disabled">
																		<span>
																			<i class="icon-caret-left bigger-140 middle"></i>
																		</span>
																	</li>

																	<li>
																		<span>
																			<input value="1" maxlength="3" type="text" />
																		</span>
																	</li>

																	<li>
																		<a href="#">
																			<i class="icon-caret-right bigger-140 middle"></i>
																		</a>
																	</li>

																	<li>
																		<a href="#">
																			<i class="icon-step-forward middle"></i>
																		</a>
																	</li>
																</ul>
															</div>
														</div>

														<div class="hide message-footer message-footer-style2 clearfix">
															<div class="pull-left"> simpler footer </div>

															<div class="pull-right">
																<div class="inline middle"> message 1 of 151 </div>

																&nbsp; &nbsp;
																<ul class="pagination middle">
																	<li class="disabled">
																		<span>
																			<i class="icon-angle-left bigger-150"></i>
																		</span>
																	</li>

																	<li>
																		<a href="#">
																			<i class="icon-angle-right bigger-150"></i>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</div><!-- /.message-container -->
												</div><!-- /.tab-pane -->
											</div><!-- /.tab-content -->
										</div><!-- /.tabbable -->
									</div><!-- /.col -->
								</div><!-- /.row -->

								<form id="id-message-form" class="hide form-horizontal message-form  col-xs-12">
									<div class="">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-recipient">Recipient:</label>

											<div class="col-sm-9">
												<span class="input-icon">
													<input type="email" name="recipient" id="form-field-recipient" data-value="alex@doe.com" value="alex@doe.com" placeholder="Recipient(s)" />
													<i class="icon-user"></i>
												</span>
											</div>
										</div>

										<div class="hr hr-18 dotted"></div>

										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-subject">Subject:</label>

											<div class="col-sm-6 col-xs-12">
												<div class="input-icon block col-xs-12 no-padding">
													<input maxlength="100" type="text" class="col-xs-12" name="subject" id="form-field-subject" placeholder="Subject" />
													<i class="icon-comment-alt"></i>
												</div>
											</div>
										</div>

										<div class="hr hr-18 dotted"></div>

										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">
												<span class="inline space-24 hidden-480"></span>
												Message:
											</label>

											<div class="col-sm-9">
												<div class="wysiwyg-editor"></div>
											</div>
										</div>

										<div class="hr hr-18 dotted"></div>

										<div class="form-group no-margin-bottom">
											<label class="col-sm-3 control-label no-padding-right">Attachments:</label>

											<div class="col-sm-9">
												<div id="form-attachments">
													<input type="file" name="attachment[]" />
												</div>
											</div>
										</div>

										<div class="align-right">
											<button id="id-add-attachment" type="button" class="btn btn-sm btn-danger">
												<i class="icon-paper-clip bigger-140"></i>
												Add Attachment
											</button>
										</div>

										<div class="space"></div>
									</div>
								</form>

								<div class="hide message-content" id="id-message-content">
									<div class="message-header clearfix">
										<div class="pull-left">
											<span class="blue bigger-125"> Clik to open this message </span>

											<div class="space-4"></div>

											<i class="icon-star orange2 mark-star"></i>

											&nbsp;
											<img class="middle" alt="John's Avatar" src="assets/avatars/avatar.png" width="32" />
											&nbsp;
											<a href="#" class="sender">John Doe</a>

											&nbsp;
											<i class="icon-time bigger-110 orange middle"></i>
											<span class="time">Today, 7:15 pm</span>
										</div>

										<div class="action-buttons pull-right">
											<a href="#">
												<i class="icon-reply green icon-only bigger-130"></i>
											</a>

											<a href="#">
												<i class="icon-mail-forward blue icon-only bigger-130"></i>
											</a>

											<a href="#">
												<i class="icon-trash red icon-only bigger-130"></i>
											</a>
										</div>
									</div>

									<div class="hr hr-double"></div>

									<div class="message-body">
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
										</p>

										<p>
											Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										</p>

										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
										</p>

										<p>
											Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
										</p>

										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
										</p>

										<p>
											Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										</p>
									</div>

									<div class="hr hr-double"></div>

									<div class="message-attachment clearfix">
										<div class="attachment-title">
											<span class="blue bolder bigger-110">Attachments</span>
											&nbsp;
											<span class="grey">(2 files, 4.5 MB)</span>

											<div class="inline position-relative">
												<a href="#" data-toggle="dropdown" class="dropdown-toggle">
													&nbsp;
													<i class="icon-caret-down bigger-125 middle"></i>
												</a>

												<ul class="dropdown-menu dropdown-lighter">
													<li>
														<a href="#">Download all as zip</a>
													</li>

													<li>
														<a href="#">Display in slideshow</a>
													</li>
												</ul>
											</div>
										</div>

										&nbsp;
										<ul class="attachment-list pull-left list-unstyled">
											<li>
												<a href="#" class="attached-file inline">
													<i class="icon-file-alt bigger-110 middle"></i>
													<span class="attached-name middle">Document1.pdf</span>
												</a>

												<div class="action-buttons inline">
													<a href="#">
														<i class="icon-download-alt bigger-125 blue"></i>
													</a>

													<a href="#">
														<i class="icon-trash bigger-125 red"></i>
													</a>
												</div>
											</li>

											<li>
												<a href="#" class="attached-file inline">
													<i class="icon-film bigger-110 middle"></i>
													<span class="attached-name middle">Sample.mp4</span>
												</a>

												<div class="action-buttons inline">
													<a href="#">
														<i class="icon-download-alt bigger-125 blue"></i>
													</a>

													<a href="#">
														<i class="icon-trash bigger-125 red"></i>
													</a>
												</div>
											</li>
										</ul>

										<div class="attachment-images pull-right">
											<div class="vspace-sm-4"></div>

											<div>
												<img width="36" alt="image 4" src="assets/images/gallery/thumb-4.jpg" />
												<img width="36" alt="image 3" src="assets/images/gallery/thumb-3.jpg" />
												<img width="36" alt="image 2" src="assets/images/gallery/thumb-2.jpg" />
												<img width="36" alt="image 1" src="assets/images/gallery/thumb-1.jpg" />
											</div>
										</div>
									</div>
								</div><!-- /.message-content -->

							


							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->

	<script src="js/jquery.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->

	<script type="text/javascript">
		window.jQuery
				|| document.write("<script src='js/jquery-2.0.3.min.js'>"
						+ "<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='js/jquery.mobile.custom.min.js'>"
					+ "<"+"/script>");
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="js/excanvas.min.js"></script>
		<![endif]-->



	<!-- ace scripts -->

	<script src="js/ace-elements.min.js"></script>
	<script src="js/ace.min.js"></script>

	<!-- inline scripts related to this page -->




	<div class="tooltip top in"
		style="top: 447px; left: 980px; display: none;">
		<div class="tooltip-inner">social networks : 38.7%</div>
	</div>
</body>
</html>