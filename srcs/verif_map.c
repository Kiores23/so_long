/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   verif_map.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amery <amery@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/12 16:16:43 by amery             #+#    #+#             */
/*   Updated: 2022/12/12 16:19:19 by amery            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long.h"
#include "so_long_verif.h"

int	verif_map(char **map)
{
	int	i;

	if (!check_dimension(map))
		return (0);
	if (!check_content(map))
		return (0);
	if (!check_close(map, 0))
		return (rerror(" Map : not closed"));
	i = 1;
	while (i)
	{
		i = 0;
		check_path(map, '0', &i);
		check_path(map, 'C', &i);
	}
	check_path(map, 'E', &i);
	while (map[i])
	{
		if (ft_strchr(map[i], 'C') || ft_strchr(map[i], 'E'))
			return (1 + rerror("Map : no path"));
		i++;
	}
	return (1);
}
