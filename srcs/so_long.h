/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   so_long.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amery <amery@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/06 10:44:12 by amery             #+#    #+#             */
/*   Updated: 2022/12/12 14:36:39 by amery            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SO_LONG_H
# define SO_LONG_H
# include <stdio.h>
# include <stdlib.h>
# include <fcntl.h>
# include "utils/so_long_utils.h"

char	**create_map(char *fdname);
int		verif_map(char **map);
int		free_map(char **map, char **map_cpy);

#endif